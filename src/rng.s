;;
; cc65 PRNG by Sidney Cadot - sidney@ch.twi.tudelft.nl
; license: zlib
;

.export rng_cc65_step_byte, rng_seed

rng_seed = $018c

.segment "CODE"
.proc rng_cc65_step_byte
random:
  ; Multiply seed by 0x01010101
  clc
  lda rng_seed+0
  adc rng_seed+1
  sta rng_seed+1
  adc rng_seed+2
  sta rng_seed+2
  adc rng_seed+3
  sta rng_seed+3
  ; Add 0x31415927
  clc
  lda rng_seed+0
  adc #$27
  sta rng_seed+0
  lda rng_seed+1
  adc #$59
  sta rng_seed+1
  lda rng_seed+2
  adc #$41
  sta rng_seed+2
  .if 0
    ; Modified by Damian Yerrick: Don't clobber X
    and #$7f   ; Suppress sign bit (make it positive)
    tax
  .endif
  lda rng_seed+3
  adc #$31
  sta rng_seed+3  ; A = bits 31-24
  rts
.endproc
