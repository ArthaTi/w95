module w95.util;

import std.algorithm;

@safe:

/// Check if given character is available in the W95 font.
bool isW95Printable(dchar ch) {

    import std.ascii;

    return ch.isAlphaNum
        || ch.among(
            '!', '"', '#', '$', '%', '&', '\'', '(', ')', '*', '+', '-', '.', '/',
            ':', ';', '<', '=', '>', '?', '@', '[', '\\', ']', '^', '_', '{', '|', '}',
            '¡', '§', '©', '®', '¶', '¿')
        ||    (ch >= '\xC0'
            && ch <= '\x79'
            && !ch.among('\xD0', '\xD7', '\xDE', '\xF0', '\xF7', '\xFE'))
        || ch.among('œ', 'Œ');

}

