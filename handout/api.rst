
(Example) The trianglelib API reference
=======================================

.. automodule:: trianglelib
   :members:

t1 == t2

The “shape” module
------------------

.. module:: trianglelib.shape

.. autoclass:: Triangle
   :members:

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

The “utils” module
------------------

.. automodule:: trianglelib.utils
   :members:
