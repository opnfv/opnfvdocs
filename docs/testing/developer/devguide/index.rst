.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. SPDX-License-Identifier: CC-BY-4.0

*********************
Test developer guide
*********************

.. toctree::
   :numbered:
   :maxdepth: 2


============
Introduction
============

The OPNFV testing ecosystem is wide.

The goal of this guide consists in providing some guidelines for new developers
involved in test areas.

For the description of the ecosystem, see `[1]`_.


=================
Developer journey
=================

Be involved in the testing group
================================

Best practices
==============

Unit tests
----------

Dockerization
-------------

API
---

CLI
---

Traffic generators
------------------

Towards a pseudo micro services approach
----------------------------------------

======================================
Testing group configuration parameters
======================================


Testing categories
==================

The testing group defined several categories also known as tiers. These
categories can be used to group test suites.

+----------------+-------------------------------------------------------------+
| healthcheck    | Simple and quick healthcheck tests case                     |
+----------------+-------------------------------------------------------------+
|   Smoke        | Set of smoke test cases/suites to validate the release      |
+----------------+-------------------------------------------------------------+
|   Features     | Test cases that validate a specific feature on top of OPNFV.|
|                | Those come from Feature projects and need a bit of support  |
|                | for integration                                             |
+----------------+-------------------------------------------------------------+
| Components     | Tests on a specific component (e.g. OpenStack, OVS, DPDK,..)|
|                | It may extend smoke tests                                   |
+----------------+-------------------------------------------------------------+
| Performance    | Performance, qualification, stress, robustness tests        |
+----------------+-------------------------------------------------------------+
| VNF            | Test cases related to deploy an open source VNF including   |
|                | an orchestrator                                             |
+----------------+-------------------------------------------------------------+

Testing domains
===============

The domains deal with the technical scope of the tests. It shall correspond to
domains defined for the certification program:

 * compute
 * network
 * storage
 * hypervisor
 * container
 * vim
 * mano
 * vnf
 * ...

Testing coverage
=================
One of the goal of the testing working group is to identify the poorly covered
areas and avoid testing overlap.
Ideally based on the declaration of the test cases, through the tags, domains
and tier fields, it shall be possible to create heuristic maps.


==============================
Testing group generic enablers
==============================


TestAPI framework
=================

The OPNFV testing group created a test collection database to collect
the test results from CI:


 http://testresults.opnfv.org/test/swagger/spec.html

 Authentication: opnfv/api@opnfv

Any test project running on any lab integrated in CI can push the
results to this database.
This database can be used to see the evolution of the tests and compare
the results versus the installers, the scenarios or the labs.


Overall Architecture
--------------------
The Test result management can be summarized as follows::

  +-------------+    +-------------+    +-------------+
  |             |    |             |    |             |
  |   Test      |    |   Test      |    |   Test      |
  | Project #1  |    | Project #2  |    | Project #N  |
  |             |    |             |    |             |
  +-------------+    +-------------+    +-------------+
           |               |               |
           V               V               V
       +-----------------------------------------+
       |                                         |
       |         Test Rest API front end         |
       |                                         |
       +-----------------------------------------+
           A                |
           |                V
           |     +-------------------------+
           |     |                         |
           |     |    Test Results DB      |
           |     |         Mongo DB        |
           |     |                         |
           |     +-------------------------+
           |
           |
     +----------------------+
     |                      |
     |    test Dashboard    |
     |                      |
     +----------------------+

TestAPI description
-------------------
The TestAPI is used to declare pods, projects, test cases and test
results. Pods are the sets of hosts and networking equipments used to run the
tests.
The results pushed in the database are related to pods, projects and
cases. If you try to push results of test done on non referenced pod,
the API will return an error message.

An additional method dashboard has been added to post-process
the raw results in release Brahmaputra (deprecated in Colorado).

The data model is very basic, 5 objects are created:

  * Pods
  * Projects
  * Testcases
  * Results
  * Scenarios

The code of the API is hosted in the releng repository `[6]`_.
The static documentation of the API can be found at `[17]`_.
The TestAPI has been dockerized and may be installed locally in your
lab. See `[15]`_ for details.

The deployment of the TestAPI has been automated.
A jenkins job manages:

  * the unit tests of the TestAPI
  * the creation of a new docker file
  * the deployment of the new TestAPI
  * the archive of the old TestAPI
  * the backup of the Mongo DB

TestAPI Authorization
~~~~~~~~~~~~~~~~~~~~~

PUT/DELETE/POST operations of the TestAPI now require token based authorization. The token needs
to be added in the request using a header 'X-Auth-Token' for access to the database.

e.g::
    headers['X-Auth-Token']

The value of the header i.e the token can be accessed in the jenkins environment variable
*TestApiToken*. The token value is added as a masked password.

.. code-block:: python

    headers['X-Auth-Token'] = os.environ.get('TestApiToken')

The above example is in Python. Token based authentication has been added so that only ci pods
jenkins job can have access to the database.

Please note that currently token authorization is implemented but is not yet enabled.

Reporting
=========

An automatic reporting page has been created in order to provide a
consistant view of the scenarios.

In this page, each scenario is evaluated according to test criteria.
The code for the automatic reporting is available at `[8]`_.

The results are collected from the centralized database every day and,
per scenario. A score is calculated based on the results from the last
10 days.

Dashboard
=========

Dashboard is used to provide a consistant view of the results collected in CI.
The results showed on the dashboard are post processed from the Database,
which only contains raw results.

In Brahmaputra, we created a basic dashboard.
Since Colorado, it was decided to adopt ELK framework (bitergia dashboard).

Bitergia already provides a dashboard for code and infrastructure.
A new Test tab will be added. The dataset will be built by consuming
the TestAPI.


=======
How TOs
=======

Where can I find information on the different test projects?
===========================================================


How can I contribute to a test project?
=======================================


Where can I find hardware resources?
====================================


How do I integrate my tests in CI?
==================================


How to declare my tests in the test Database?
=============================================


How to push your results into the Test Database?
================================================

The test database is used to collect test results. By default it is
enabled only for CI tests from Production CI pods.

The architecture and associated API is described in previous chapter.
If you want to push your results from CI, you just have to call the API
at the end of your script.

You can also reuse a python function defined in functest_utils.py::

    def push_results_to_db(db_url, case_name, logger, pod_name,version, payload):
      """
      POST results to the Result target DB
      """
      url = db_url + "/results"
      installer = get_installer_type(logger)
      params = {"project_name": "functest", "case_name": case_name,
                "pod_name": pod_name, "installer": installer,
                "version": version, "details": payload}

      headers = {'Content-Type': 'application/json'}
      try:
          r = requests.post(url, data=json.dumps(params), headers=headers)
          if logger:
              logger.debug(r)
          return True
      except Exception, e:
          print "Error [push_results_to_db('%s', '%s', '%s', '%s', '%s')]:" \
              % (db_url, case_name, pod_name, version, payload), e
          return False


Where can I find the documentation on the test API?
===================================================

http://artifacts.opnfv.org/releng/docs/testapi.html



I have tests, to which category should I declare them?
======================================================



The main ambiguity could be between features and VNF.
In fact sometimes you have to spawn VMs to demonstrate the capabilities of the
feature you introduced.
We recommend to declare your test in the feature category.

VNF category is really dedicated to test including:

 * creation of resources
 * deployement of an orchestrator/VNFM
 * deployment of the VNF
 * test of the VNFM
 * free resources

The goal is not to study a particular feature on the infrastructure but to have
a whole end to end test of a VNF automatically deployed in CI.
Moreover VNF are run in weekly jobs (one a week), feature tests are in daily
jobs and use to get a scenario score.

Where are the logs of Ci runs?
==============================

Logs and configuration files can be pushed to artifact server from the CI under
http://artifacts.opnfv.org/<project name>


==========
References
==========

_`[1]`: http://docs.opnfv.org/en/stable-danube/testing/ecosystem/overview.html

_`[2]`: http://www.opnfv.org

_`[3]`:

_`[4]`: https://wiki.opnfv.org/display/INF/CI+Scenario+Naming

_`[5]`:

_`[6]`:

_`[7]`:

_`[8]`:

_`[9]`: http://testresults.opnfv.org/reporting/

_`[10]`:

_`[11]`:

_`[12]`:

_`[13]`: http://testresults.opnfv.org/test/api/v1/projects/functest/cases

_`[14]`:

_`[15]`:

_`[16]`:

_`[17]`: http://artifacts.opnfv.org/releng/docs/testapi.html

IRC support chan: #opnfv-functest
