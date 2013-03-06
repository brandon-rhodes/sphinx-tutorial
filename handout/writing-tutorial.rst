
Writing ‘tutorial.rst’
======================

Having written our low-level API documentation,
we are now going to turn to the first thing a new user reads:
your tutorial!

The tutorial is short to keep this tutorial from going too long,
but it does try to both serve the real purpose of a tutorial,
which is to show users how to get started with your library,
and it also should help you practice reStructuredText.

Remember to add your tutorial document's filename
to the table of contents in your ``index.rst`` file!

While plain ``names`` and ``attributes`` are simply
displayed in a typewriter font, ``functions()`` and ``methods()``
should be followed by a pair of parenthesis to make them look right.

Your task is to make the tutorial's text look as pretty
as it does in the printed copy here in this handout.
Here are some bonus goals if you finish early:

1. Do you know whether the sample program really works?
   Add a deliberate mistake to it and try running ``make`` ``doctest``
   to see if you really get presented with an error.
   If no error appears, then consult the previous :doc:`quick-sphinx`
   chapter and try to figure out how to mark up the code and output
   so that they get tested.

2. Whenever a module, class, or function is mentioned
   in the text, you should mark it to create a cross-reference
   into the API document you have already written.
   Try out the following two styles of cross-reference
   and see what difference they make in your formatted output::

    the :class:`trianglelib.shape.Triangle` class
    the :class:`~trianglelib.shape.Triangle` class

3. If you managed to get the quote from Euclid to appear
   at the top of your tutorial, how might you make it appear
   in the index under the entry “Euclid”?

4. In the sentence “Read *The trianglelib guide* to learn more”,
   we want the phrase “The trianglelib guide” to become
   an actual hyperlink to the guide itself.
   Create a nearly empty ``guide.rst`` document that consists
   of just an underlined title for right now,
   add it to your table of contents,
   and see whether you can make the cross reference a clickable link.
