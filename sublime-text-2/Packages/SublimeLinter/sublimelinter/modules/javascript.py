# -*- coding: utf-8 -*-
# javascript.py - sublimelint package for checking Javascript files

import os
import json
import re
import subprocess

from base_linter import BaseLinter, INPUT_METHOD_TEMP_FILE

CONFIG = {
    'language': 'JavaScript'
}


class Linter(BaseLinter):
    GJSLINT_RE = re.compile(r'Line (?P<line>\d+),\s*E:(?P<errnum>\d+):\s*(?P<message>.+)')

    def __init__(self, config):
        super(Linter, self).__init__(config)
        self.use_jsc = False
        self.linter = None

    def get_executable(self, view):
        self.linter = view.settings().get('javascript_linter', 'jshint')

        if (self.linter == 'jshint'):
            foundEngine, path, message = self.get_javascript_engine(view)
            self.use_jsc = path == self.jsc_path()
            return (foundEngine, path, message)
        elif (self.linter == 'gjslint'):
            try:
                path = self.get_mapped_executable(view, 'gjslint')
                subprocess.call([path, '--help'], startupinfo=self.get_startupinfo())
                self.input_method = INPUT_METHOD_TEMP_FILE
                return (True, path, 'using gjslint')
            except OSError:
                return (False, '', 'gjslint cannot be found')
        else:
            return (False, '', '"{0}" is not a valid javascript linter'.format(self.linter))

    def get_lint_args(self, view, code, filename):
        if (self.linter == 'gjslint'):
            args = []
            gjslint_options = view.settings().get("gjslint_options", [])
            args.extend(gjslint_options)
            args.extend(['--nobeep', filename])
            return args
        elif (self.linter == 'jshint'):
            path = self.jshint_path()
            jshint_options = json.dumps(view.settings().get("jshint_options") or {})

            if self.use_jsc:
                args = (os.path.join(path, 'jshint_jsc.js'), '--', str(code.count('\n')), jshint_options, path + os.path.sep)
            else:
                args = (os.path.join(path, 'jshint_node.js'), jshint_options)

            return args
        else:
            return []

    def jshint_path(self):
        return os.path.join(os.path.dirname(__file__), 'libs', 'jshint')

    def parse_errors(self, view, errors, lines, errorUnderlines, violationUnderlines, warningUnderlines, errorMessages, violationMessages, warningMessages):
        if (self.linter == 'gjslint'):
            ignore = view.settings().get('gjslint_ignore', [])

            for line in errors.splitlines():
                match = self.GJSLINT_RE.match(line)

                if match:
                    line, errnum, message = match.group('line'), match.group('errnum'), match.group('message')

                    if (int(errnum) not in ignore):
                        self.add_message(int(line), lines, message, errorMessages)

        elif (self.linter == 'jshint'):
            errors = json.loads(errors.strip() or '[]')

            for error in errors:
                lineno = error['line']
                self.add_message(lineno, lines, error['reason'], errorMessages)
                self.underline_range(view, lineno, error['character'] - 1, errorUnderlines)
