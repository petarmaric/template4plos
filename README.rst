About
=====

A modified version of the `PLOS LaTeX template`_, preconfigured for automated
preparation of your LaTeX paper for submission in PLOS journals.

Please cite this project in your papers::

    @misc{template4plos,
      title={{template4plos public code repository}},
      author={Mari{\'c}, Petar},
      year={2019},
      url={https://github.com/petarmaric/template4plos},
    }

.. _`PLOS LaTeX template`: https://journals.plos.org/plosone/s/latex

Installation
============

This project doesn't require system wide installation, simply `create a new
repository based on the template4plos repository template`_ and then clone it
to get started::

    $ git clone https://github.com/your-account/your-paper.git
    $ cd your-paper
    $ pipenv install

.. _`create a new repository based on the template4plos repository template`: https://github.com/petarmaric/template4plos/generate

Usage
=====

Show help::

    $ pipenv run make help
    Usage: make [TARGET]...

    Targets:
      help              Display this help message
      build             Build the paper
      export            Prepare the paper for journal submission
      clean-built       Remove the papers build directory
      clean-exported    Remove the papers export directory
      clean             Remove both the build and export directories
      view-built        View the papers built PDF file (runs 'build' if needed)
      view-exported     View the papers exported PDF file (runs 'export' if needed)
      view              View both the built and exported PDF files

Quick start:

#. write your paper, while keeping in mind you can edit **any** file freely:

   #. add/remove sections
   #. update ``Makefile`` to build your figures programmatically
   #. add more LaTeX packages to ``preamble.tex``, or change their options
   #. ...

#. build (and check) your paper often as you write::

    $ pipenv run make view-built

#. prepare your paper for journal submission::

    $ pipenv run make view-exported

#. submit files from the ``export`` directory to the journal

Using Docker
------------

If you do not wish to install a LaTeX distribution on your system you can use
the dockerized version of template4plos instead:

- show help::

    $ ./dockerized.sh help
    Usage: make [TARGET]...

    Targets:
      help              Display this help message
      build             Build the paper
      export            Prepare the paper for journal submission
      clean-built       Remove the papers build directory
      clean-exported    Remove the papers export directory
      clean             Remove both the build and export directories
      view-built        View the papers built PDF file (runs 'build' if needed)
      view-exported     View the papers exported PDF file (runs 'export' if needed)
      view              View both the built and exported PDF files

- build your paper::

    $ ./dockerized.sh build

- prepare your paper for journal submission::

    $ ./dockerized.sh export

Contribute
==========

If you find any bugs, or wish to propose new features `please let us know`_.

If you'd like to contribute, simply fork `the repository`_, commit your changes
and send a pull request. Make sure you add yourself to `CONTRIBUTORS`_.

.. _`please let us know`: https://github.com/petarmaric/issues/new
.. _`the repository`: https://github.com/petarmaric
.. _`CONTRIBUTORS`: https://github.com/petarmaric/template4plos/blob/master/CONTRIBUTORS
