#!/usr/bin/env python
import argparse
import codecs
import json
import pystache


def parse_args():
    parser = argparse.ArgumentParser(description='Generates invoices')
    parser.add_argument('-c', '--config', type=str,
        help='Configuration file (json)')
    parser.add_argument('-r', '--recipient', type=str,
        help='Invoice recipient (json)')
    parser.add_argument('-o', '--output', type=str,
        help='Output file (tex)')
    parser.add_argument('-t', '--template', type=str,
        help='Template file (tex)')

    return parser.parse_args()


def read(path):
    with codecs.open(path, encoding='utf-8') as f:
        return f.read()


def write(path, data):
    with codecs.open(path, 'w', encoding='utf-8') as f:
        f.write(data)


def run():
    args = parse_args()
    tpl = read(args.template)
    config = json.loads(read(args.config))
    config['recipient'] = json.loads(read(args.recipient))

    out = args.output
    write(out, pystache.render(tpl, config))
    print 'Wrote ' + out + '!'


if __name__ == '__main__':
    run()
