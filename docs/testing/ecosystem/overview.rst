.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0

=============
OPNFV testing
=============

Introduction
============

Testing is one of the key activities in OPNFV and includes unit, feature, component, system 
level testing for development, automated deployment, performance characterization or stress 
testing.

Test projects are dedicated to provide frameworks, tooling and test-cases catagorized as 
functional, performance or compliance testing. Test projects fulfill different roles such as 
verifying VIM functionality, benchmarking components and platforms or analysis of measured 
KPIs for the scenarios released in OPNFV.

Feature projects also provide their own test suites that either run independently or within a
test project.

This document details the OPNFV testing ecosystem, describes test commonality used
by the projects and provides links to project specific documentation.


OPNFV testing ecosystem
=======================

The testing projects
--------------------

The OPNFV testing projects may be summarized as follows:

.. figure:: https://wiki.opnfv.org/download/attachments/8688867/EcoSystem%20Copy.png
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
|                | provides a framework to find the bottlenecks of OPNFV   |
|                | infrastructure.                                         |
+----------------+---------------------------------------------------------+
| CPerf          | SDN Controller benchmarks and performance testing,      |
|                | applicable to controllers in general.                   |
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
|                | (OpenStack, ODL, ONOS,..) and can be used by feature    |
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
| VSperf         | This project provides a framework for NFV data-plane    | 
|                | performance testing and benchmarking i.e. the NFVI      |
|                | fast-path including switch technology and network with  |
|                | physical and virtual interfaces. This can be used for   |
|                | evaluating the suitability of different vSwitch         |
|                | implementations with various platform configurations    |
|                | in a Telco NFV deployment or help optimize system       |
|                | performance in the context of a specific use-case.      |
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

The assets
==========

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
A Mongo DB Database has been introduced in Brahmaputra.
The following collections are declared in this database:
 * pods: the list of pods used for production CI
 * projects: the list of projects providing test cases
 * testcases: the test cases related to a given project
 * results: the results of the test cases
 * scenarios: the OPNFV scenarios tested in CI

This database can be used by any project through the testapi.
Please note that projects may also use additional databases. This database is
mainly use to colelct CI results and scenario trust indicators.

This database is cloned for plugfest.


The test API
------------
The Test API is used to declare pods, projects, test cases and test
results. Pods are the pods used to run the tests.
The results pushed in the database are related to pods, projects and
cases. If you try to push results of test done on non referenced pod,
the API will return an error message.

An additional method dashboard has been added to post-process
the raw results in release Brahmaputra (deprecated in Colorado).

The data model is very basic, 4 objects are created:

  * Pods
  * Projects
  * Testcases
  * Results

Pods::

  {
    "id": <ID>,
    "details": <URL description of the POD>,
    "creation_date": "YYYY-MM-DD HH:MM:SS",
    "name": <The POD Name>,
    "mode": <metal or virtual>,
    "role": <ci-pod or community-pod or single-node>
  },

Projects::

  {
    "id": <ID>,
    "name": <Name of the Project>,
    "creation_date": "YYYY-MM-DD HH:MM:SS",
    "description": <Short description>
  },

Testcases::

  {
    "id": <ID>,
    "name":<Name of the test case>,
    "project_name":<Name of belonged project>,
    "creation_date": "YYYY-MM-DD HH:MM:SS",
    "description": <short description>,
    "url":<URL for longer description>
  },

Results::

  {
    "_id": <ID>,
    "case_name": <Reference to the test case>,
    "project_name": <Reference to project>,
    "pod_name": <Reference to POD where the test was executed>,
    "installer": <Installer Apex or Compass or Fuel or Joid>,
    "version": <master or Colorado or Brahmaputra>,
    "start_date": "YYYY-MM-DD HH:MM:SS",
    "stop_date": "YYYY-MM-DD HH:MM:SS",
    "build_tag": <such as "jenkins-functest-fuel-baremetal-daily-master-108">,
    "scenario": <Scenario on which the test was executed>,
    "criteria": <PASS or FAILED>,
    "trust_indicator": {
                        "current": 0,
                        "histories": []
                       }
  }

  Scenarios::

    {
      "id": <ID>,
      "name":<Name of the test case>,
      "name" : "os-odl_l2-nofeature-ha",
      "installers":[
       {
       "installer" : <installer name>,
       "versions": [
           {
            "version": <version name>,
            "owner": <scenario owner>,
            "custom list": { "projects": [{
                                 "functest" : [ "vping_ssh", "vping_userdata", "tempest_smoke_serial", "rally_sanity", "odl", "doctor"],
                                 "yardstick" : [ "tc002","tc005","tc010","tc011","tc012","tc014","tc037","tc055","tc063","tc069","tc070","tc071","tc072","tc075"]}]},
            "score": { "projects": [{
                                  "functest" : [{"date": YYY-MM-DD HH:MM, "score":<score>}, {"date": YYY-MM-DD HH:MM, "score":<score>}, ...],
                                  "yardstick" : [{"date": YYY-MM-DD HH:MM, "score":<score>}, {"date": YYY-MM-DD HH:MM, "score":<score>}, ...]}]},
            "trust_indicator": { "projects": [{
            "functest" : [{"date": YYY-MM-DD HH:MM,"status":<status>}, {"date": YYY-MM-DD HH:MM,"status":<status>},...],
            "yardstick" : [{"date": YYY-MM-DD HH:MM,"status":<status>}, {"date": YYY-MM-DD HH:MM,"status":<status>},...]}]}},
          { ....
    },

For detailed information, please go to

 http://testresults.opnfv.org/test/swagger/spec.html

 Authentication: opnfv/api@opnfv

Please notes that POST/DELETE/PUT operations for test or study purpose via
swagger website is not allowed, because it will change the real data in
the database.


The reporting
-------------
Until Colorado, each testing project was reporting a status on a dedicated page.
It was decided to unify the reporting by creating a landing page that should give
the scenario status in one glance (it was previously consolidated manually
on a wiki page). The landing page will be display per scenario:
 * the status of the deployment
 * the score of the test projectS
 * a trust indicator

Additional filters (version, installer, test collection time window,... )

This landing page has been dockerized. The back end relies on the testing DB.

 TODO: add picture

The test case catalog
----------------------
Until Colorado, each testing project was managing the list of its test cases. It
was very hard to have a global view of the available test cases among the
different test projects. A common view was possible through the API but it was
not very user friendly.
It was decided to build a web site providing a consistent view of the test cases
per project and allow any scenario owner to build his/her custom list of tests.
The test catalog can be described as below::

 TODO: add picture

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
| CPerf          | https://wiki.opnfv.org/display/meetings/CPerf           |
+----------------+---------------------------------------------------------+
| Dovetail       | https://wiki.opnfv.org/display/dovetail/Dovetail        |
+----------------+---------------------------------------------------------+
| Functest       | https://wiki.opnfv.org/display/functest/                |
+----------------+---------------------------------------------------------+
| Qtip           | https://wiki.opnfv.org/display/qtip                     |
+----------------+---------------------------------------------------------+
| Storperf       | https://wiki.opnfv.org/display/storperf/Storperf        |
+----------------+---------------------------------------------------------+
| VSperf         | https://wiki.opnfv.org/display/vsperf/VSperf            |
+----------------+---------------------------------------------------------+
| Yardstick      | https://wiki.opnfv.org/display/yardstick/Yardstick      |
+----------------+---------------------------------------------------------+
