#!/usr/bin/env python
import argparse
import codecs
import json


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


def fieldify(config):
    class Proxy(dict):
        def __init__(self, a):
            for k, v in a.items():
                self[k] = Proxy(v) if isinstance(v, dict) else v

        def __getattr__(self, a):
            return self.get(a, '')

    ret = Proxy(config)

    print ret.name

    return ret


def run():
    args = parse_args()
    tpl = read(args.template)
    config = json.loads(read(args.config))
    config['recipient'] = json.loads(read(args.recipient))

    out = args.output
    write(out, tpl.format(**fieldify(config)))
    print 'Wrote ' + out + '!'


if __name__ == '__main__':
    run()
