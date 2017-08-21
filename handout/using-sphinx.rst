
Notes on Using Sphinx
=====================

Here are some quick notes on running Sphinx successfully.
Each topic will be elaborated upon at the right point
during our class.

Starting a Sphinx project
-------------------------

The wonder of a properly designed framework
is that it begins by positioning you at a working starting point
instead of leaving you to wander endlessly through a ``README``
that, after dozens of steps, leaves you guessing which step
you did improperly to have wound up with a broken install.

Sphinx gets you started with ``sphinx-quickstart``.
Here is how a quick-start session will look,
paying attention only to its prompts and how you should respond
(which is mostly by pressing Return over and over),
when you use it to create a new project::

   $ sphinx-quickstart
   Welcome to the Sphinx quickstart utility...

   > Root path for the documentation [.]: doc
   > Separate source and build directories (y/N) [n]:
   > Name prefix for templates and static dir [_]:
   > Project name: trianglelib
   > Author name(s): Brandon
   > Project version: 1.0
   > Project release [1.0]:
   > Project language [en]:
   > Source file suffix [.rst]: .rst
   > Name of your master document (without suffix) [index]: index
   > Do you want to use the epub builder (y/N) [n]: n
   > autodoc: automatically insert docstrings ... (y/N) [n]: y
   > doctest: automatically test code snippets ... (y/N) [n]: y
   > intersphinx: ... (y/N) [n]:
   > todo: ... (y/N) [n]:
   > coverage: ... (y/N) [n]:
   > pngmath: ... (y/N) [n]:
   > mathjax: ... (y/N) [n]: y
   > ifconfig: ... (y/N) [n]:
   > viewcode: include links to the source code ... (y/N) [n]: y
   > githubpages: ... (y/n) [n]:
   > Create Makefile? (Y/n) [y]: y
   > Create Windows command file? (Y/n) [y]: y

Sphinx layout
-------------

After you have succeeded in quick-starting,
your project should look something like this,
if we imagine that you created your ``doc`` Sphinx directory
right next to your ``trianglelib`` Python package directory::

 your-project/
 |-- doc/
 |   |-- Makefile
 |   |-- _build/
 |   |-- _static/
 |   |-- _templates/
 |   |-- conf.py
 |   |-- index.rst
 |   `-- make.bat
 |-- setup.py
 `-- trianglelib/
     |-- __init__.py
     |-- shape.py
     `-- utils.py

The ``index.rst`` is your initial documentation file,
whose table of contents you will expand
as you add additional ``.rst`` files to this directory.

Hints
-----

Here are a few adjustments you can make to a Sphinx project
once you have its files laid out and set up.

* Sphinx is sensitive to indentation —
  blocks and code snippets end when the indentation level
  returns to its previous level —
  but Sphinx is usually forgiving about how far exactly you indent;
  you can generally choose freely how far to indent,
  so long as you are then consistent about sticking to that level.
  Sphinx is much like Python in this regard,
  but without a strong community preference for a particular
  number of spaces per indentation level.

* Build your documentation by changing directory
  to the directory that contains the ``Makefile`` and then running::

    make html

* You can view the documentation by running Python's built-in
  web server, opening ``http://localhost:8000/`` in your web browser,
  and navigating into the ``_build/html`` directory::

    python -m SimpleHTTPServer

* Feel free to create directories beneath ``doc``
  for groups of ``.rst`` files that do not belong at the top level.
  Simply refer to such files in your ``index.rst`` table of contents
  using a ``dir/filename`` syntax so that Sphinx can find them.

* You can get rid of the line that says “Contents:” in ``index.rst``
  since it causes a bizarre blank page in the PDF output.

* To make prettier PDFs, remove the whole section in ``index.rst``
  named “Indices and tables.”

* Do not despair if you realize later that you need an extension
  that you failed to answer ``y`` to during the quick-start;
  simply go into the ``conf.py`` and add the extension to the
  ``extensions`` list and make any other changes the extension needs.
  You can always simply re-run the quick start to make a new project
  with the extension active, then run ``diff`` between your own
  ``Makefile`` and the new one to see what the differences are.

* You can use Semantic Newlines to be friendly to your version control.

* Here is a small diagram of how I think of documentation,
  which we will use as a rough guide during class::

                       developer             developer
      new user       writing new code       reading code
         |                 |                     |
         v                 v                     v
      tutorial  <-->  topical guides  <-->  API reference

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
   not mixed in or sitting beneath its own documentation.

2. Set the Python path environment variable
   to point to the directory containing your package.
   You can do this with an ``export`` statement
   that you run before you start building your documentation::

    export PYTHONPATH=/home/brandon/trianglelib

   Or you can set the Python path only for the build command itself,
   leaving your shell variable settings pristine::

    PYTHONPATH=/home/brandon/triangle-project make html

   *The downside:* You either have to remember to manually
   set this environment variable each time you run Sphinx,
   or you have to create and maintain a small shell script
   as a separate file that will remember to set the path and run Sphinx.

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
   they will always have the same relative position on the filesystem.
   In this case, you can simply edit the Sphinx ``conf.py``
   so that its ``sys.path`` configuration entry
   points at the relative position of your package::

    sys.path.append(os.path.abspath('../triangle-project'))

   *All upside:* this is, in my opinion, the best approach,
   as it always goes along for the ride with your repository,
   and works immediately upon repository check-out
   without having to rely on any intermediate setup steps.

Deployment
----------

We will discuss this topic in depth,
but here are some links for your further reference
when the class is complete:

* It should be possible to export the contents of ``_build/html``
  to any file-system-based web service and serve it as static content.

* You can package the documentation in a ZIP file
  and upload it using the “edit” page for your Python package,
  and it will appear at the URL:

  ``http://pythonhosted.org/<project-name>``

  Detailed instructions for this procedure live at:

  http://pythonhosted.org/

* The powerful and popular Read the Docs service
  lets you configure your GitHub repository
  so that every time you push a new version of your software,
  the documentation gets automatically rebuilt
  and made available at:

  ``https://readthedocs.org/projects/<project-name>/``

  Read the Docs also supports custom host names
  if you want your documentation to appear beneath your own
  project sub-domain.
  More information is available at:

  https://readthedocs.org/

* Creating a PDF is nearly as simple as running::

    make html

  Except that you have to have the Latex typesetting system installed,
  which is a daunting task on many platforms and operating systems.
  On my own Ubuntu Linux laptops,
  I need to install several packages before even attempting it::

    texlive-fonts-recommended
    texlive-latex-recommended
    texlive-latex-extra

* See the Sphinx documentation for several other supported formats!

* We will tackle simple theming tasks during the tutorial's
  second half; remember that the PyEphem project is a good living
  example of how to completely replace the Sphinx HTML themes
  with one of your own, so that you are essentially using Sphinx
  to build your own web site.
