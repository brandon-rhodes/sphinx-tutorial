
Writing ‘tutorial.rst’
======================

Having written our low-level API documentation,
we are now going to turn to the first thing a new user reads:
your tutorial!

The tutorial is deliberately short,
since there is no way to generate it automatically —
you will be typing it in my hand —
but it does try to both serve the real purpose of a tutorial,
which is to show users how to get started with your library,
and it also should help you practice reStructuredText.

To begin with,
just focus on getting the text typed in,
then turn to trying to make it format correctly.
Remember to add ``tutorial`` as the first document
listed in your ``index.rst`` file!

Here are two bonus goals if you finish early:

1. Whenever a module, class, or function is mentioned
   in the text, you should mark it to create a cross-reference
   into the API document you have already written.
   Try out the following two styles of cross-reference
   and see what difference they make in your formatted output::

    the :class:`trianglelib.shape.Triangle` class
    the :class:`~trianglelib.shape.Triangle` class

2. Do you know whether the code examples really works?
   Try running ``make doctest`` to try out your code
   examples and see if they really work.
   If the command runs without reporting any errors,
   then try deliberately introducing and error and re-running
   ``make doctest`` so that you can see how its error output looks.
