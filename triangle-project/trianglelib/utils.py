"""Routines to test triangle properties without explicit instantiation."""

from trianglelib.shape import Triangle

def _make_triangle(a, b, c):
    try:
        return Triangle(a, b, c)
    except ValueError:
        return None

def is_triangle(a, b, c):
    """Return whether lengths `a`, `b`, `c` can be the sides of a triangle."""
    t = _make_triangle(a, b, c)
    return (t is not None)

def is_equilateral(a, b, c):
    """Return whether lengths `a`, `b`, and `c` are an equilateral triangle."""
    t = _make_triangle(a, b, c)
    return (t is not None) and t.is_equilateral()

def is_isosceles(a, b, c):
    """Return whether lengths `a`, `b`, and `c` are an isosceles triangle."""
    t = _make_triangle(a, b, c)
    return (t is not None) and t.is_isosceles()

def compute_perimeter(a, b, c):
    """Return the perimeer of the triangle with side lengths `a`, `b`, and `c`.

    If the three lengths provided cannot be the sides of a triangle,
    then the perimeter 0 is returned.

    """
    t = _make_triangle(a, b, c)
    return 0 if (t is None) else t.perimeter()

def compute_area(a, b, c):
    """Return the area of the triangle with side lengths `a`, `b`, and `c`.

    If the three lengths provided cannot be the sides of a triangle,
    then the area 0 is returned.

    """
    t = _make_triangle(a, b, c)
    return 0 if (t is None) else t.area()
