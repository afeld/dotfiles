import re

from base_linter import BaseLinter

CONFIG = {
    'language': 'c_cpplint',
    'executable': 'cpplint.py',
    'test_existence_args': ['--help'],
    'lint_args': '-',
}


class Linter(BaseLinter):
    def parse_errors(self, view, errors, lines, errorUnderlines, violationUnderlines, warningUnderlines, errorMessages, violationMessages, warningMessages):
        for line in errors.splitlines():
            match = re.match(r'^.+:(?P<line>\d+):\s+(?P<error>.+)', line)

            if match:
                error, line = match.group('error'), match.group('line')
                self.add_message(int(line), lines, error, errorMessages)
