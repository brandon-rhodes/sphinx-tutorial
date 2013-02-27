from distutils.core import setup
import trianglelib

setup(
    name='trianglelib',
    description=trianglelib.__doc__.splitlines()[0],
    author='Brandon Rhodes',
    author_email='brandon@rhodesmill.org',
    py_modules=['trianglelib'],
    )
