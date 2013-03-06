
Writing ‘guide.rst’
===================

Given how much markup you have already learned,
you will probably find marking up the Guide
to be a more modest challenge than those you have enjoyed so far.
Once you have it marked up and looking good,
here is a list of bonus challenges you might try out:

1. Make all of the references to function, class, and method names
   turn into real hyperlinks into the API chapter.

2. In accomplishing the first goal,
   you probably had to use the package name ``trianglelib``
   quite a lot, which involves a quite depressing amount of repetition.
   While you cannot use the ``module::`` directive here,
   since this is not the API documentation, try using the directive
   ``currentmodule::`` ``trianglelib`` at the top of the Guide
   and verify that you can then remove the module name
   from the beginning of all of your cross references.

3. Are the doctests in the guide really running
   every time you type ``make`` ``doctest``?
   Try ending the paragraph that precedes them with ``:``
   and then with ``::`` and observe the difference in results.

4. Note the three periods that form an ellipsis ``"..."``
   in the traceback shown in the guide.
   This is a standard established long ago
   by the Python Standard Library's doctest module
   that lets you avoid including the whole ugly traceback —
   which you would then have to edit and correct
   every time a line number changed in one of your source files!
   Try removing the ellipsis to confirm that ``make`` ``doctest``
   indeed fails if it is asked to literally match
   the contents of the traceback.

5. I have grown to dislike doctests more and more over the years,
   most recently because users cannot easily cut-and-paste doctest code
   into their own programs without then having to manually backspace
   over all of the ``>>>`` prompts that get pasted in with the code.
   Convert the example in the :ref:`triangle-dimensions` section
   into a ``testcode::`` block and a ``testoutput::`` block instead,
   and confirm that the block is getting detected, executed, and
   tested when you run ``make`` ``doctest``.

6. If you are able to access the Sphinx documentation
   during the tutorial, look up the ``math`` Sphinx extension
   and try to figure out how I made the inequality equation
   so very pretty.
   As a super bonus, see if you can replace the inequality
   with this equivalent expression:

.. math::

   {a + b \over c} > 1
