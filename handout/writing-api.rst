
Writing ‘api.rst’
=================

Your first assignment is to create your own ``api.rst`` document
whose output looks just like the chapter
“The trianglelib API reference” at the end of this handout!

Approach this task as three smaller steps.
For your first try, just use three plain autodoc directives
to generate your entire chapter from the contents
of the ``trianglelib`` docstrings.
Separate the three ``autodoc`` directives
with sub-titles to make the chapter more organized::

    The trianglelib API reference
    =============================

    .. automodule:: trianglelib
       :members:

    The “shape” module
    ------------------

    .. automodule:: trianglelib.shape
       :members:

    The “utils” module
    ------------------

    .. automodule:: trianglelib.utils
       :members:

Add ``api`` to the list of chapters in your table of contents
in the ``index.rst`` file, and then build the resulting document.
Note that you will get errors
if Sphinx cannot find the ``trianglelib`` Python module,
in which case you should consult the solutions
in the :doc:`using-sphinx` chapter of this document.

Once your build is successful, take a look at your output document.
It should already contain most of the information that you need!
Compare the output carefully with the corresponding example
bound with this documentation.
What changes will you have to learn how to make
in order to get the two documents to match?

For example:
where is the text describing how to instantiate ``Triangle``?
You will need to add it manually,
because ``autodoc`` does not pull that information from your code.
So you will need to take control of that class's presentation.
To take control,
switch ``shape`` from the using the ``automodule::`` directive
to using the plain old ``module::`` directive,
which produces *no output* of its own
but makes you explicitly provide its contents yourself.
This frees you up to build your own version of ``Triangle``
that includes some introductory text before getting to work
on its members:

::

    .. module:: trianglelib.shape

    .. autoclass:: Triangle
       :members:

       <Describe instantiation here!>

Note that the name of the class ``Triangle``
does not have to be prefixed with ``trianglelib.shape.``
because the ``module::`` directive
had already told Sphinx about where to look
for the classes and methods that you describe in this file.

You are getting closer,
but the documentation still does not look exactly the same.
For one thing, the first method shown right now is ``area()``
since functions and attributes
are shown in alphabetical order by default.
Try each of the following directives in turn
to achieve some other possible orderings::

   :member-order: bysource

   :member-order: groupwise

   :members: is_equilateral, is_isosceles, ...

Note that you can also say ``:exclude-members:``
followed by the names of methods to leave out.

At that point your API chapter
will begin to strongly resemble the printed one!
Here are further bonus goals in case you finish early:

1. How can you display the attributes ``a``, ``b``, and ``c``
   as presented in the printed document?

2. The printed chapter describes the triangle ``__eq__()`` method
   by actually showing two triangles compared with the ``==`` operator;
   can you get your version of the document to show the same thing?

3. If you have not done so already, add in the example doctest
   that stands just beneath the instantiation instructions
   in the printed version of the chapter.

4. Try running ``make`` ``doctest`` — are your code samples correct?
   Add some deliberate errors into the code to see what the output
   looks like when doctests fail.

5. Create example doctests for a few of the functions in ``utils``
   by turning off ``automodule`` for the ``utils`` module,
   explicitly autodoc'ing each of its five functions
   to pull them back into your documentation,
   and adding example code beneath each one.
