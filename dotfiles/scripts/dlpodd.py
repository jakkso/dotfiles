#!/usr/bin/env python3
"""Tag mp3s files downloaded by youtube-dl."""

import re
import sys

from tagger import tag_file

PATTERN = re.compile(r'\[ffmpeg\] Destination: (.+)\n')


def get_name(input_string: str) -> str:
    """Return filename file downloaded by ``mp3`` bash function."""
    filename = PATTERN.search(input_string)
    if not filename:
        return ""
    return filename.groups()[0]


if __name__ == '__main__':
    output = sys.stdin.read()
    file = get_name(output)
    print(output)
    if not file:
        msg = 'Unable to get filename!'
        exit_code = 1
    else:
        tag_file(
            file,
            artist="Audio from Youtube",
            album="Youtube Audio",
        )
        msg = f"Downloaded and tagged {file}"
        exit_code = 0
    print(msg)
    quit(exit_code)
