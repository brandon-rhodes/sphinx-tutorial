from unittest import TestCase
from trianglelib import shape, utils

class TestShape(TestCase):

    def test_rotations(self):
        t = shape.Triangle(4, 5, 6)
        assert t._rotations() == ((4, 5, 6), (6, 4, 5), (5, 6, 4))

    def test_eq(self):
        t = shape.Triangle(4, 5, 6)
        assert t == shape.Triangle(4, 5, 6)
        assert t == shape.Triangle(6, 4, 5)
        assert t == shape.Triangle(5, 6, 4)

    def test_is_similar(self):
        t = shape.Triangle(4, 5, 6)
        assert t.is_similar(shape.Triangle(4, 5, 6))
        assert t.is_similar(shape.Triangle(10, 12, 8))

    def test_is_equilateral(self):
        assert shape.Triangle(4, 5, 6).is_equilateral() is False
        assert shape.Triangle(4, 4, 4).is_equilateral() is True

    def test_is_isosceles(self):
        assert shape.Triangle(4, 5, 6).is_isosceles() is False
        assert shape.Triangle(4, 5, 5).is_isosceles() is True

    def test_perimeter(self):
        assert shape.Triangle(4, 5, 6).perimeter() == 15
        assert shape.Triangle(30, 40, 50).perimeter() == 120

    def test_area(self):
        assert shape.Triangle(3, 4, 5).area() == 6
        assert shape.Triangle(30, 40, 50).area() == 600

    def test_scale(self):
        assert shape.Triangle(3, 4, 5).scale(10) == shape.Triangle(30, 40, 50)

class TestUtils(TestCase):

    def test_is_triangle(self):
        assert utils.is_triangle(4, 5, 6) is True
        assert utils.is_triangle(10, 20, 40) is False

    def test_is_equilateral(self):
        assert utils.is_equilateral(4, 5, 60) is False
        assert utils.is_equilateral(4, 5, 6) is False
        assert utils.is_equilateral(6, 6, 6) is True

    def test_is_isosceles(self):
        assert utils.is_isosceles(6, 6, 70) is False
        assert utils.is_isosceles(4, 5, 6) is False
        assert utils.is_isosceles(6, 6, 7) is True

    def test_compute_perimeter(self):
        assert utils.compute_perimeter(6, 6, 70) == 0
        assert utils.compute_perimeter(4, 5, 6) == 15
        assert utils.compute_perimeter(6, 6, 7) == 19

    def test_compute_area(self):
        assert utils.compute_area(6, 6, 70) == 0
        assert utils.compute_area(3, 4, 5) == 6
        assert utils.compute_area(30, 40, 50) == 600
