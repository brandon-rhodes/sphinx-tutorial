
Example: tutorial.rst — The trianglelib tutorial
================================================

This module makes triangle processing fun.
The beginner will enjoy how the :mod:`trianglelib.utils` module
lets you get started quickly.

>>> from trianglelib import utils
>>> utils.is_isosceles(5, 5, 7)
True

Fancy programmers use the :class:`trianglelib.shape.Triangle` class
to create a triangle exactly once
then perform lots of operations.
This Python program:

.. testcode::

   from trianglelib.shape import Triangle
   t = Triangle(5, 5, 5)
   print 'Equilateral?', t.is_equilateral()

produces this output:

.. testoutput::

    Equilateral? True

Read the ``users guide`` to learn more!
