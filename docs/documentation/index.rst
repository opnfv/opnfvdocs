.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Open Platform for NFV Project, Inc. and its contributors

*******************
OPNFV Documentation
*******************

.. toctree::
   :maxdepth: 2

=====================
Release Documentation
=====================

OPNFV relese documentation is structured with brief platform level documents referencing
more detailed instalation instructions and descriptive documentation.

Platform documentation
======================

* The OPNFV overview document provides a high level overview of the OPNFV release.

  * http://artifacts.opnfv.org/opnfvdocs/docs/overview/index.html

* The installation & configuration guide will guide users on how to decide which scenario
  is of interest based on their needs and how to install and configure OPNFV.

  * http://artifacts.opnfv.org/opnfvdocs/docs/installationprocedure/index.html

* The user guide provides an overview of how to work with the OPNFV platform once installed.

  * http://artifacts.opnfv.org/opnfvdocs/docs/userguide/index.html

Installation instructions
=========================

The installation instructions for OPNFV leverage open source installation toolchains to install
and configure the components comprising the OPNFV NFVi.  For details of which installation tolchain
might be best for you, refer to the installation procedure documentation.

* `Apex installation instruction`_
* `Compass installation instruction`_
* `Fuel installation instruction`_
* `Joid installation instruction`_

.. _Apex installation instruction: http://artifacts.opnfv.org/apex/docs/installation-instructions/index.html
.. _Compass installation instruction: http://artifacts.opnfv.org/compass4nfv/docs/configguide/index.html
.. _Fuel installation instruction: http://artifacts.opnfv.org/fuel/docs/installationprocedure/index.html
.. _Joid installation instruction: http://artifacts.opnfv.org/joid/docs/configguide/index.html


Project release documentation
=============================

----------------------------------------------
Copper, policy features, release documentation
----------------------------------------------

The copper project focused on enabling policy related features in the OPNFV platform.
The `release documentation for copper`_ provides information about the projct including: 

* Configuration of policy related features are described in the `copper configuration guide`_.
* Usage of the features and capabilities enabled by the copper project are described in the `copper user guide`_.

.. _release documentation for copper: http://artifacts.opnfv.org/copper/docs/design/index.html
.. _copper configuration guide: http://artifacts.opnfv.org/copper/docs/configguide/index.html
.. _copper user guide: http://artifacts.opnfv.org/copper/docs/userguide/index.html

-----------------------------------------------------
Doctor, fault notification, features and capabilities
-----------------------------------------------------

The doctor project focuses on developing fault notification and state awareness features
in the OPNFV platform.  The `doctor overview document`_ provides a brief introduction to these
capabilities and the ´doctor user guide`_ explains how to leverage the capabilities.

.. _doctor overview document: http://artifacts.opnfv.org/doctor/brahmaputra/docs/platformoverview/index.html
.. _doctor user guide: http://artifacts.opnfv.org/doctor/brahmaputra/docs/userguide/index.html

---------------------------------------
High Availability in the OPNFV platform
---------------------------------------

The availability project in OPNFV documents and addresses a variety of `high availability scenarios`_
and identifies `platform needs for supporting high availability`_.

.. _high availability scenarios: https://wiki.opnfv.org/download/attachments/2926157/scenario_analysis_for_high_availability_in_nfv.pdf?version=1&modificationDate=1458849162000&api=v2
.. _platform needs for supporting high availability: https://wiki.opnfv.org/download/attachments/2926157/releases_brahmaputra_ha_requirement.pdf?version=1&modificationDate=1458849162000&api=v2

------------------------------------
IPv6 platform support and capability
------------------------------------

The IPv6 project has been working on enabling IPv6 in OPNFV, configuration and `installation of routing functions`_,
and providing an up to date analysis of the IPv6 capabilities and gaps in their `IPv6 userguide`_.

.. _installation of routing functions: http://artifacts.opnfv.org/ipv6/brahmaputra/docs/reldoc/index.html
.. _IPv6 userguide: http://artifacts.opnfv.org/ipv6/docs/userguide/index.html

=======================
Developer Documentation
=======================

.. there are some dev guides out there.  Let's provide links if this section makes sense here

Developer guides, engaging with and contributing to projects
============================================================

Need to ad some links here.

Future Work and Requirements
============================

----------------------------------------
Network readiness study and requirements
----------------------------------------

The network readiness, "netready", project focuses on analysing key NFV use cases and describing
the platform capabilities required to realise them in future OPNFV releases.  The netready project
produces a `Network Readiness report`_ that provides insight and anaylsis for activities planned in OPNFV.

.. _Network Readiness report: http://artifacts.opnfv.org/netready/docs/requirements/index.html

