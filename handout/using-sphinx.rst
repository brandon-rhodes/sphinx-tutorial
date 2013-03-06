
Notes on Using Sphinx
=====================

Here are some quick notes on running Sphinx successfully.
Each topic will be elaborated upon at the right point
during our class.

* Get rid of the line that says “Contents:” in ``index.rst``
  since it causes a bizarre blank page in the PDF output,
  and remove the whole section named “Indices and tables.”

Helping autodoc find your package
---------------------------------

In order to run ``autodoc`` directives on your package,
the Python interpreter that is running Sphinx for you
needs to be able to import your package.
You can test whether Python can see your package
by testing whether this command returns without error::

    python -c 'import your_package'

There are three general approaches
to making your package available to ``autodoc``.

1. Have your package's top-level directory
   sit right next to your Sphinx ``Makefile`` and ``conf.py``
   and all of your top-level RST text files.
   When you type ``make`` inside this directory
   and it goes off and runs Sphinx,
   your package will be visible
   because it is sitting in the current working directory.

   *The downside:* you usually want your package
   sitting out by itself in your source distribution,
   not mixed in or sitting beneath its documentation.

2. Set the Python path environment variable
   to point to the directory containing your package.
   You can do this with an ``export`` statement
   that you run before you start building your documentation::

    export PYTHONPATH=/home/brandon/trianglelib

   Or you can set the Python path only for the build command itself,
   leaving your shell variable settings pristine:

    PYTHONPATH=/home/brandon/triangle-project make html

   *The downside:* You either have to remember to manually
   set this environment variable each time you run Sphinx,
   or you have to create and maintain a small shell script
   as a separate file that will set the path and run Sphinx.

3. If you have installed Sphinx inside a virtual environment —
   which is a really, really great idea —
   then you can install your under-development package there too
   by using the pip ``--editable`` flag::

    pip install -e /home/brandon/triangle-project

   Once you have run this command, the Python running
   inside of this virtual environment is permanently able
   to ``import`` ``trianglelib`` without further ado.
   (Assuming that you do not remove the project from your filesystem!)

   *The downside:* When you check the project out
   on to a fresh machine, you either have to always remember
   to manually set up the virtual environment the right way,
   or you have to keep a shell script in the repository
   that sets it up for you each time.
   (Even though that is a good idea anyway.)

4. Assuming that your package and its documentation
   are part of the same source repository — as they should be —
   they will always have the same relative position on the filesystem
   of someone who has checked the project out of version control.
   In this case, you can simply edit the Sphinx ``conf.py``
   so that its ``sys.path`` configuration entry
   points at the relative position of your package::

    sys.path.append(os.path.abspath('../triangle-project'))

   *All upside:* this is, in my opinion, the best approach,
   as it always goes along for the ride with your repository,
   and works immediately upon repository check-out
   without having to rely on any intermediate setup steps.

html server
pdf
