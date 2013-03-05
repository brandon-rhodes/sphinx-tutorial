
Example: api.rst — The trianglelib API reference
================================================

.. automodule:: trianglelib
   :members:

The “shape” module
------------------

.. module:: trianglelib.shape

.. autoclass:: Triangle
   :members: is_equilateral, is_isosceles, is_similar,
             perimeter, area, scale

   You instantiate a ``Triangle``
   by providing exactly three lengths ``a``, ``b``, and ``c``.
   They can either be intergers or floating-point numbers,
   and should be listed clockwise around the triangle.
   If the three lengths *cannot* make a valid triangle,
   then ``ValueError`` will be raised instead.

   >>> from trianglelib.shape import Triangle
   >>> t = Triangle(3, 4, 5)
   >>> print t.is_equilateral()
   False
   >>> print t.area()
   6.0

   Triangles support the following attributes, operators, and methods.

   .. attribute:: a
                  b
                  c

      The three side lengths provided during instantiation.

   .. index:: pair: equality; triangle
   .. method:: triangle1 == triangle2

      Returns true if the two triangles have sides of the same lengths,
      in the same order.
      Note that it is okay if the two triangles
      happen to start their list of sides at a different corner;
      ``3,4,5`` is the same triangle as ``4,5,3``
      but neither of these are the same triangle
      as their mirror image ``5,4,3``.

The “utils” module
------------------

.. automodule:: trianglelib.utils
   :members:
