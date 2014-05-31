#! /bin/bash

OPENOCD=/usr/local/bin/openocd
SCRIPTS=./scripts

INTERFACE=interface/stlink-v2.cfg

BOARD=board/stm32f4discovery.cfg

$OPENOCD -s $SCRIPTS -f $INTERFACE -f $BOARD
