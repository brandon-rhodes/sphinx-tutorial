
Example: guide.rst — The trianglelib guide
==========================================

Whether you need to test the properties of triangles,
or learn their dimensions, ``trianglelib`` does it all!

Special triangles
-----------------

There are three special kinds of triangle
that the :class:`trianglelib.shape.Triangle` class can detect:

*Equilateral*
    Whether the triangle has three sides all the same length.

*Isosceles*
    Whether at least two of the triangle's sides are equal length.

If you are not interested in instantiating a triangle object,
then you can access the same logic
through the :mod:`trianglelib.utils` module;
look for the functions whose names start with ``is_``.

Triangle size
-------------

The library can compute triangle perimeter, area,
and can also compare two triangles for equality.
Note that it does not matter which side you start with,
so long as two triangles have the same three in the same order!

.. testcode::

   from trianglelib.shape import Triangle
   t1 = Triangle(3, 4, 5)
   t2 = Triangle(4, 5, 3)
   t3 = Triangle(3, 4, 6)
   print 'Equal', t1 == t2
   print 'Equal', t1 == t3
   print 'Area', t3.area()

.. testoutput::

    Equilateral? True

Valid triangles
---------------

Many combinations of three numbers do not make a real triangle.
Even if all three numbers are positive,
one of the numbers can still be so large
that the other two sides would not actually meet to make a polygon.
If *c* is the longest side, then a triangle is only possible if:

    a + b < c

Consult the ``API reference`` for how classes and functions react
when you provide them with an invalid triangle.
