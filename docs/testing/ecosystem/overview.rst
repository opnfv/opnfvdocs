.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. SPDX-License-Identifier: CC-BY-4.0

=============
OPNFV testing
=============

Introduction
============

Testing is one of the key activities in OPNFV and includes unit, feature, component, system
level testing for development, automated deployment, performance characterization or stress
testing.

Test projects are dedicated to provide frameworks, tooling and test-cases categorized as
functional, performance or compliance testing. Test projects fulfill different roles such as
verifying VIM functionality, benchmarking components and platforms or analysis of measured
KPIs for the scenarios released in OPNFV.

Feature projects also provide their own test suites that either run independently or within a
test project.

This document details the OPNFV testing ecosystem, describes common test components used
by individual OPNFV projects and provides links to project specific documentation.


OPNFV testing ecosystem
=======================

The testing projects
--------------------

The OPNFV testing projects may be summarized as follows:

.. figure:: ../../images/OPNFV_testing_working_group.png
   :align: center
   :alt: Overview of OPNFV Testing projects

The major testing projects are described in the table below:

+----------------+---------------------------------------------------------+
|  Project       |   Description                                           |
+================+=========================================================+
|  Bottlenecks   | This project aims to find system bottlenecks by testing |
|                | and verifying OPNFV infrastructure in a staging         |
|                | environment before committing it to a production        |
|                | environment. Instead of debugging a deployment in       |
|                | production environment, an automatic method for         |
|                | executing benchmarks which plans to validate the        |
|                | deployment during staging is adopted. This project      |
|                | forms a staging framework to find bottlenecks and to do |
|                | analysis of the OPNFV infrastructure.                   |
+----------------+---------------------------------------------------------+
| CPerf          | SDN Controller benchmarks and performance testing,      |
|                | applicable to controllers in general. Collaboration of  |
|                | upstream controller testing experts, external test tool |
|                | developers and the standards community. Primarily       |
|                | contribute to upstream/external tooling, then add jobs  |
|                | to run those tools on OPNFV's infrastructure.           |
+----------------+---------------------------------------------------------+
| Dovetail       | This project intends to define and provide a set of     |
|                | OPNFV related validation criteria that will provide     |
|                | input for the evaluation of the use of OPNFV trademarks.|
|                | The dovetail project is executed with the guidance and  |
|                | oversight of the Compliance and Certification committee |
|                | and work to secure the goals of the C&C committee for   |
|                | each release. The project intends to incrementally      |
|                | define qualification criteria that establish the        |
|                | foundations of how we are able to measure the ability to|
|                | utilize the OPNFV platform, how the platform itself     |
|                | should behave, and how applications may be deployed on  |
|                | the platform.                                           |
+----------------+---------------------------------------------------------+
| Functest       | This project deals with the functional testing of the   |
|                | VIM and NFVI. It leverages several upstream test suites |
|                | (OpenStack, ODL, ONOS, etc.) and can be used by feature |
|                | project to launch feature test suites in CI/CD.         |
|                | The project is used for scenario validation.            |
+----------------+---------------------------------------------------------+
| Qtip           | QTIP as the project for "Platform Performance           |
|                | Benchmarking" in OPNFV aims to provide user a simple    |
|                | indicator for performance, supported by comprehensive   |
|                | testing data and transparent calculation formula.       |
|                | It provides a platform with common services for         |
|                | performance benchmarking which helps users to build     |
|                | indicators by themselves with ease.                     |
+----------------+---------------------------------------------------------+
| Storperf       | The purpose of this project is to provide a tool to     |
|                | measure block and object storage performance in an NFVI.|
|                | When complemented with a characterization of typical VF |
|                | storage performance requirements, it can provide        |
|                | pass/fail thresholds for test, staging, and production  |
|                | NFVI environments.                                      |
+----------------+---------------------------------------------------------+
| VSperf         | This project provides a framework for automation of NFV |
|                | data-plane performance testing and benchmarking. The    |
|                | NFVI fast-path includes switch technology and network   |
|                | with physical and virtual interfaces. VSperf can be     |
|                | used to evaluate the suitability of different Switch    |
|                | implementations and features, quantify data-path        |
|                | performance and optimize platform configurations.       |
+----------------+---------------------------------------------------------+
| Yardstick      | The goal of the Project is to verify the infrastructure |
|                | compliance when running VNF applications. NFV Use Cases |
|                | described in ETSI GS NFV 001 show a large variety of    |
|                | applications, each defining specific requirements and   |
|                | complex configuration on the underlying infrastructure  |
|                | and test tools.The Yardstick concept decomposes typical |
|                | VNF work-load performance metrics into a number of      |
|                | characteristics/performance vectors, which each of them |
|                | can be represented by distinct test-cases.              |
+----------------+---------------------------------------------------------+


===================================
The testing working group resources
===================================

Test collection framework
=========================

Any test project running on any lab integrated in CI can push the
results to this database.
This database can be used to see the evolution of the tests and compare
the results versus the installers, the scenarios or the labs.
It is used to produce a dashboard with the current test status of the project.

Please note that you can deploy the test Database and test API locally in your
own environment.

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
       +---------------------------------------------+
       |                                             |
       |           Test Rest API front end           |
       |    http://testresults.opnfv.org/test        |
       |                                             |
       +---------------------------------------------+
           ^                |                     ^
           |                V                     |
           |     +-------------------------+      |
           |     |                         |      |
           |     |    Test Results DB      |      |
           |     |         Mongo DB        |      |
           |     |                         |      |
           |     +-------------------------+      |
           |                                      |
           |                                      |
     +----------------------+        +----------------------+
     |                      |        |                      |
     | Testing Dashboards   |        |      Landing page    |
     |                      |        |                      |
     +----------------------+        +----------------------+


The testing databases
---------------------
A Mongo DB Database has been introduced for the Brahmaputra release.
The following collections are declared in this database:
 * pods: the list of pods used for production CI
 * projects: the list of projects providing test cases
 * testcases: the test cases related to a given project
 * results: the results of the test cases
 * scenarios: the OPNFV scenarios tested in CI

This database can be used by any project through the testapi.
Please note that projects may also use additional databases. This database is
mainly use to colelct CI results and scenario trust indicators.

This database is also cloned for OPNFV Plugfest.


TestAPI description
-------------------
The Test API is used to declare pods, projects, test cases and test results.
Pods correspond to the cluster of machines (3 controller and 2 compute nodes in
HA mode) used to run the tests and defined in Pharos project.
The results pushed in the database are related to pods, projects and cases.
If you try to push results of test done on non referenced pod, the API will
return an error message.

An additional method dashboard has been added to post-process the raw results in
the Brahmaputra release (deprecated in Colorado release).

The data model is very basic, 5 objects are available:
  * Pods
  * Projects
  * Testcases
  * Results
  * Scenarios

For detailed information, please go to http://artifacts.opnfv.org/releng/docs/testapi.html

The code of the API is hosted in the releng repository `[2]`_.
The static documentation of the API can be found at `[3]`_.
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
---------------------

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

TestAPI Portal
--------------
The portal has been developed for the CVP. It consumes the TestAPI.


Reporting pages
===============
The reporting page for the test projects is http://testresults.opnfv.org/reporting/

.. figure:: ../../images/reporting_page.png
   :align: center
   :alt: Testing group reporting page

This page provides a reporting per OPNFV release and per testing project.

.. figure:: ../../images/reportingMaster.png
   :align: center
   :alt: Testing group Euphrates reporting page

An evolution of this page is planned.
It was decided to unify the reporting by creating a landing page that should give
the scenario status in one glance (it was previously consolidated manually
on a wiki page).

The landing page (planned for Danube 2.0) will be displayed per scenario:
 * the status of the deployment
 * the score of the test projectS
 * a trust indicator

Additional filters (version, installer, test collection time window,... ) are
included.


Test case catalog
=================
Until the Colorado release, each testing project was managing the list of its
test cases. It was very hard to have a global view of the available test cases
among the different test projects. A common view was possible through the API
but it was not very user friendly.
In fact you may know all the cases per project calling:

 http://testresults.opnfv.org/test/api/v1/projects/<project_name>/cases

with project_name: bottlenecks, functest, qtip, storperf, vsperf, yardstick

A test case catalog has been realized. Roll over the project then click to get
the list of test cases, click on the case to get more details.

.. raw:: html
   :url: http://testresults.opnfv.org/testing/index.html#!/select/visual

Dashboards
==========

Dashboard is used to provide a consistent view of the results collected in CI.
The results showed on the dashboard are post processed from the Database,
which only contains raw results.

It can be used in addition of the reporting page (high level view) to allow
the creation of specific graphs according to what the test owner wants to show.

In Brahmaputra, a basic home made dashboard was created in Functest.
In Colorado, Yardstick adopted Grafana (time based graphs) and ELK (complex
graphs).
Since Danube, the testing community decided to adopt ELK framework and to rely
on bitergia.

.. raw:: html
   :url: https://opnfv.biterg.io:443/goto/283dba93ca18e95964f852c63af1d1ba


Other resources
===============

wiki: https://wiki.opnfv.org/testing

mailing list: test-wg@lists.opnfv.org

IRC chan: #opnfv-testperf

weekly meeting (https://wiki.opnfv.org/display/meetings/TestPerf):
 * Usual time: Every Thursday 15:00-16:00 UTC / 7:00-8:00 PST
 * APAC time: 2nd Wednesday of the month 8:00-9:00 UTC


=======================
Reference documentation
=======================

+----------------+---------------------------------------------------------+
|  Project       |   Documentation links                                   |
+================+=========================================================+
|  Bottlenecks   | https://wiki.opnfv.org/display/bottlenecks/Bottlenecks  |
+----------------+---------------------------------------------------------+
| CPerf          | https://wiki.opnfv.org/display/cperf                    |
+----------------+---------------------------------------------------------+
| Dovetail       | https://wiki.opnfv.org/display/dovetail                 |
+----------------+---------------------------------------------------------+
| Functest       | https://wiki.opnfv.org/display/functest/                |
+----------------+---------------------------------------------------------+
| Qtip           | https://wiki.opnfv.org/display/qtip                     |
+----------------+---------------------------------------------------------+
| Storperf       | https://wiki.opnfv.org/display/storperf/Storperf        |
+----------------+---------------------------------------------------------+
| VSperf         | https://wiki.opnfv.org/display/vsperf                   |
+----------------+---------------------------------------------------------+
| Yardstick      | https://wiki.opnfv.org/display/yardstick/Yardstick      |
+----------------+---------------------------------------------------------+


`[1]`_: OPNFV web site

`[2]`_: Test utils in Releng

`[3]`_: TestAPI autogenerated documentation


.._`[1]`: http://www.opnfv.org

.._`[2]`: https://git.opnfv.org/functest/tree/releng/utils/tests

.._`[3]`: http://artifacts.opnfv.org/releng/docs/testapi.html
