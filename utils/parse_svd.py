#! /usr/bin/python

import svd

_svd_file = 'STM32F40x.svd'

def dump_peripheral(p):
    if p.registers:
        for r in p.registers.register:
            print('%s->%s' % (p.name, r.name))


def main():
    xml = open(_svd_file).read()
    soc = svd.CreateFromDocument(xml)
    [dump_peripheral(p) for p in soc.peripherals.peripheral]

main()

