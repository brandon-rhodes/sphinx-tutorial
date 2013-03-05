
RST Quick Reference
===================

::

 Underline titles with punctuation
 =================================

 For subtitles, switch to another punctuation mark
 -------------------------------------------------

 *Italic* **bold** ``name`` ``function()`` ``expression = 3 + 3``
 `Hyperlink <http://en.wikipedia.org/wiki/Hyperlink>`_ `Link`_

 .. _Link: http://en.wikipedia.org/wiki/Link_(The_Legend_of_Zelda)
 .. image:: images/python-logo.png
 .. A comment block starts with two periods, can continue indented.

 A paragraph is one or more lines of un-indented text, separated
 from the material above and below by blank lines.

     “Block quotes look like paragraphs, but are indented with
     one or more spaces.”

 | Because of the pipe characters, this will become one line,
 | And this will become another line, like in poetry.

 term
   Definition for the “term”, indented beneath it.

 * Each item in a list starts with an asterisk (or “1.”, “a.”, etc).
 * List items can go on for several lines as long as you remember to
   keep the rest of the list item indented.

 Code blocks are introduced by a double-colon and are indented::

     import docutils

 >>> print 'But doctests start with ">>>" and need no indentation.'
