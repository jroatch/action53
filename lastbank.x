#
# Linker script for Action 53
# Copyright 2010-2012 Damian Yerrick
#
# Copying and distribution of this file, with or without
# modification, are permitted in any medium without royalty
# provided the copyright notice and this notice are preserved.
# This file is offered as-is, without any warranty.
#
MEMORY {
  # Does not add an iNES header.  That will be added by the menu builder
  # (tools/a53build.py).
  ZP:       start = $10, size = $f0, type = rw;
  # use first $10 zeropage locations as locals
  RAM:      start = $0200, size = $0600, type = rw;
  ROM63:    start = $8000, size = $8000, type = ro, file = %O, fill=yes, fillval=$FF;
}

SEGMENTS {
  ZEROPAGE:   load = ZP, type = zp;
  KEYBLOCK:   load = ROM63, type = ro, start = $8000, optional=yes;
  PAGERODATA: load = ROM63, type = ro, start = $c000;
  CODE:       load = ROM63, type = ro;
  RODATA:     load = ROM63, type = ro;
  OAM:        load = RAM, type = bss, define = yes, align = $100;
  LOWCODE:    load = ROM63, run = RAM, type = rw, define = yes, align = $100;
  VOICEDATA:  load = ROM63, type = ro, start = $e500;
  BSS:        load = RAM, type = bss, define = yes, align = $100;
  FFF0:       load = ROM63, type = ro, start = $FFF0;
}

FILES {
  %O: format = bin;
}

