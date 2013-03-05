
Writing ‘api.rst’
=================

Your first task is to create your own ``api.rst`` document
whose output looks just like the “The trianglelib API” chapter
at the end of this handout!

You should approach your task in three steps.
For your first try, just use three straight autodoc calls
to generate your entire chapter.
Each autodoc call will look like this::

    .. automodule:: <Python module name>
       :members:

Make three autodoc calls like this in a row,
one for each of these three module names::

    trianglelib
    trianglelib.shape
    trianglelib.utils

The resulting chapter already contains most of the information you need!
Try adding sub-titles for the ``shape`` and ``utils`` modules,
since otherwise readers will have a hard time telling
where one section ends and the next begins.

But where is the text describing how to instantiate ``Triangle``?
You need to add it manually,
and to do this,
you need to take control of that class's presentation.
Switch the ``shape`` from the using the ``automodule`` directive
to using the plain old ``module` directive,
which produces *no output* of its own
but makes you explicitly list its contents yourself.
This frees you up to build your own presentation for ``Triangle``:

::

    .. module:: triangles.shape

    .. autoclass:: Triangle
       :members:

       <Describe instantiation here!>

At that point your API chapter
should look very much like the one attached!
Here are three bonus goals in case you finish early:

1. Add in the example doctest
   that stands just beneath the instantiation instructions
   in the printed version of the chapter.

2. Create example doctests for a few of the functions in ``utils``
   by turning off ``automodule`` for the ``utils`` module,
   explicitly autodoc'ing each of its five functions
   to pull them back into your documentation,
   and adding example code beneath each one.
