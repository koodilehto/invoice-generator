#!/usr/bin/env python
import argparse
import codecs
import json
import re


def run():
    """Format the template using the data from the argument files."""
    args = parse_args()
    tpl = read(args.template)
    config = json.loads(read(args.config))
    config['recipient'] = json.loads(read(args.recipient))

    out = args.output
    write(out, render(tpl, fieldify(config)))
    print 'Wrote ' + out + '!'


def render(tpl, fields):
    """Substitute text in <angle brackets> with corresponding variable value."""
    regex = re.compile('\<([a-zA-Z.]+)\>', re.MULTILINE)

    def repl(m):
        group = m.group(1)
        parts = group.split('.')
        value = fields

        for part in parts:
            try:
                value = value[part]
            except KeyError:
                value = ''

        return value

    return regex.sub(repl, tpl)


def parse_args():
    """Read the command line arguments and return an object containing them."""
    parser = argparse.ArgumentParser(description='Generates invoices')
    parser.add_argument('-c', '--config', type=str,
        help='Configuration file (json)', required=True)
    parser.add_argument('-r', '--recipient', type=str,
        help='Invoice recipient (json)', required=True)
    parser.add_argument('-o', '--output', type=str,
        help='Output file (tex)', required=True)
    parser.add_argument('-t', '--template', type=str,
        help='Template file (tex)', required=True)

    return parser.parse_args()


def read(path):
    """Read files with UTF safely."""
    with codecs.open(path, encoding='utf-8') as f:
        return f.read()


def write(path, data):
    """Write files with UTF safely."""
    with codecs.open(path, 'w', encoding='utf-8') as f:
        f.write(data)


def fieldify(config):
    """Fill template field data structure with actual data."""
    class Proxy(dict):
        def __init__(self, a):
            for k, v in a.items():
                self[k] = Proxy(v) if isinstance(v, dict) else v

        def __getattr__(self, a):
            return self.get(a, '')

    return Proxy(config)


if __name__ == '__main__':
    run()
