"""Contain mp3 tagging function.

Requires mutagen library to be installed.
"""

from mutagen import File
from mutagen.easyid3 import EasyID3
from mutagen.id3 import ID3NoHeaderError


def tag_file(filename, **kwargs):
    """Use mutagen to tag MP3 files."""
    try:
        tag = EasyID3(filename)
    except ID3NoHeaderError:
        tag = File(filename, easy=True)
        tag.add_tags()
    for arg, value in kwargs.items():
        tag[arg] = value
    tag.save(filename)
