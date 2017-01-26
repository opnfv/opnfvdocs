
=============================================
Including your Documentation
=============================================

.. contents::
   :depth: 3
   :local:

In your project repository
----------------------------

Add your documentation to your repository in the folder structure and
according to the templates listed above. The documentation templates you
will require are available in the opnfvdocs repository, you should
copy the relevant templates to the /docs/ directory in your repository.
For instance if I wanted to document userguide, then my steps shall be
as follows:

.. code-block:: bash

   git clone ssh://<your_id>@gerrit.opnfv.org:29418/opnfvdocs.git
   cp -p opnfvdocs/docs/userguide/* <my_repo>/docs/userguide/


You should then add the relevant information to the template that will
explain the documentation. When you are done writing, you can commit
the documentation to the project repository.

.. code-block:: bash

   git add .
   git commit --signoff --all
   git review

In OPNFVDocs Composite Documentation
--------------------------------------

In toctree
+++++++++++

To import project documents from project repositories, we use submodules.
 Each project is stored in :code:`opnfvdocs/docs/submodule/` as follows:

.. image:: Submodules.jpg
   :scale: 50 %

To include your project specific documentation in the composite documentation,
first identify where your project documentation should be included.
Say your project userguide should figure in the ‘OPNFV Userguide’, then:


.. code-block:: bash

   vim opnfvdocs/docs/release/userguide.introduction.rst

This opens the text editor. Identify where you want to add the userguide.
If the userguide is to be added to the toctree, simply include the path to
it, example:


.. code-block:: bash

   .. toctree::
       :maxdepth: 1

    submodules/functest/docs/userguide/index
    submodules/bottlenecks/docs/userguide/index
    submodules/yardstick/docs/userguide/index
    <submodules/path-to-your-file>

As Hyperlink
+++++++++++++

It's pretty common to want to reference another location in the
OPNFV documentation and it's pretty easy to do with
reStructuredText. This is a quick primer, more information is in the
`Sphinx section on Cross-referencing arbitrary locations
<http://www.sphinx-doc.org/en/stable/markup/inline.html#ref-role>`_.

Within a single document, you can reference another section simply by::

   This is a reference to `The title of a section`_

Assuming that somewhere else in the same file there a is a section
title something like::

   The title of a section
   ^^^^^^^^^^^^^^^^^^^^^^

It's typically better to use ``:ref:`` syntax and labels to provide
links as they work across files and are resilient to sections being
renamed. First, you need to create a label something like::

   .. _a-label:

   The title of a section
   ^^^^^^^^^^^^^^^^^^^^^^

.. note:: The underscore (_) before the label is required.

Then you can reference the section anywhere by simply doing::

    This is a reference to :ref:`a-label`

or::

    This is a reference to :ref:`a section I really liked <a-label>`

.. note:: When using ``:ref:``-style links, you don't need a trailing
          underscore (_).

Because the labels have to be unique, it usually makes sense to prefix
the labels with the project name to help share the label space, e.g.,
``sfc-user-guide`` instead of just ``user-guide``.

Once you have made these changes you need to push the patch back to
the opnfvdocs team for review and integration.

.. code-block:: bash

   git add .
   git commit --signoff --all
   git review

Be sure to add the project leader of the opnfvdocs project
as a reviewer of the change you just pushed in gerrit.
