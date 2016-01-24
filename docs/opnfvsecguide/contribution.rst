=================
How to Contribute
=================

Anyone is welcome to make additions, raise bugs, and fix issues within this
Documentation.

To do so, you will however need to first get an environment set up.

Development Environment
~~~~~~~~~~~~~~~~~~~~~~~

All project data such as formatting guidelines, and upstream mapping is
documented via sphinx which uses reStructuredText

Git / Gerrit Setup
~~~~~~~~~~~~~~~~~~

For the below to work, you will need to have a linux foundation account setup,
and have added your public SSH key to gerrit.

  git clone ssh://<your-username>@gerrit.opnfv.org:29418/opnfvdocs

  cd opnfvdocs/docs/opnfvsecguide

  git review -s

Now make your changes to the documentation, and then perform a git add to
'stage' the changes.

  git add .

* If you prefer, you can cherry pick a change i.e.
  git add myfile.txt

  git commit -a --signoff

Add a descriptive change of what you did, and save out of the commit window
(so if your in vi then :wq) and make a push for review.

  git review

Now await for core reviewers to +1 and it will get built to artefacts ,
you will see the url on the gerrit page returned by git review.

Here is an example:

  [hinds@casper opnfvsecguide] $ git review
  remote: Resolving deltas: 100% (6/6)
  remote: New file detected, please ensure that it has the correct license header
  remote: Processing changes: new: 1, refs: 1, done
  remote:
  remote: New Changes:
  remote:   https://gerrit.opnfv.org/gerrit/7825
  remote:
  To ssh://lukehinds@gerrit.opnfv.org:29418/opnfvdocs.git
  [new branch]      HEAD -> refs/publish/master

Sphinx Basics
~~~~~~~~~~~~~

To get started with sphinx, visit the main tutorial which will provide a
primer `http://sphinx-doc.org/tutorial.html`

Remember doc8 to save build rejection

D001
lines should not be longer than 79 characters, plus some exceptions

D002
no trailing whitespace

D003
no tabulation for indentation

D004
no carriage returns (use unix newlines)

Verify & Build Locally
~~~~~~~~~~~~~~~~~~~~~~

Navigate to the root folder 'opnfvdocs/'

Install a virtualenv

  virtualenv env

Source the env:

  source env/bin/activate

Install doc8 and sphinx

  pip install sphinx doc8

Clone releng:

  git clone ssh://lukehinds@gerrit.opnfv.org:29418/releng

You can now test and build locally

  ./releng/utils/docs-build.sh

Its also worth dumping the stdout into a file to inspect post run

  ./releng/utils/docs-build.sh > build.txt
