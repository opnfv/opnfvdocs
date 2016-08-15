.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Sofia Wallin Ericsson AB

Abstract
========

The following information provides instructions for the deployment of a given OPNFV installer that is delivered with in the
Colorado release.

The Colorado release provides options with regards to installation tools: Apex, Compass4Nfv, Fuel and JOID. Each of these installer
provides the ability to deploy a common OPNFV platform as well as additional features delivered within the OPNFV community.  

============
Introduction
============

The OPNFV platform is comprised of a variety of upstream components that may be deployed on your pysical
infrastructure using a variety of tools.  A composition of components, tools and configurations is
identified in OPNFV as a deployment scenario.
The various OPNFV scenarios provide unique features and capabilities that you may want to leverage,
it is important to understand your required target platform capabilities before installing and
configuring your target scenario.

An OPNFV installation requires either a physical, or virtual, infrastructure environment as defined
in the Pharos specification. When configuring a physical infrastructure it is strongly advised to
follow the Pharos configuration guidelines. 
<Pharosspec>
<Pharosvirtspec>

=========
Scenarios
=========

OPNFV scenarios are designed to host virtualised network functions (VNF’s) in a variety of deployment
architectures and locations. Each scenario provides specific capabilities and/or components aimed to
solve specific problems for the deployment of VNF’s.
A scenario may, for instance, include components such as OpenStack, OpenDaylight, OVS, KVM etc...
where each scenario will include different source components or configurations.

To learn more about the scenarios' supported in the Colorado release refer to the scenario
description documents provided:

- `os-nosdn-ovs <http://artifacts.opnfv.org/ovsnfv/colorado/docs/scenarios/index.html>`_
  
- `os-nosdn-fdio-noha <http://artifacts.opnfv.org/fds/docs/scenarios_os-nosdn-fdio-noha-single/index.html>`_
    
- `os-odl-12-fdio-noha <http://artifacts.opnfv.org/fds/colorado/scenarios_os-odl_l2-fdio-noha/index.html>`_


======================
Installation procedure
======================

Installation of OPNFV requires instructions and functions provided by a OPNFV installer. OPNFV supports
four different deployment tools including Apex, Compass4nfv, Fuel and Joid. The instructions for each of these can be found below.

- `Apex installation instruction <http://artifacts.opnfv.org/apex/colorado/docs/installationprocedure/index.html>`_

- `Compass4nfv installation instruction <http://artifacts.opnfv.org/compass4nfv/colorado/docs/installationprocedure/index.html>`_

- `Fuel installation instruction <http://artifacts.opnfv.org/fuel/colorado/docs/installationprocedure/index.html>`_

  - `Joid installation instruction <http://artifacts.opnfv.org/joid/colorado/docs/installationprocedure/index.html>`_
    
=====================
OPNFV Test Frameworks
=====================

After deploying targeted installer please make sure that you run the relevant tests suites.

- `Functest user guide <http://artifacts.opnfv.org/functest/colorado/docs/userguide/index.html>`_
  
- `Yardstick user guide <http://artifacts.opnfv.org/yardstick/colorado/docs/userguide/index.html>`_
    
- `vSwitchPerf user guide <http://artifacts.opnfv.org/vswitchperf/colorado/index.html>`_
      
- `Software Fastpath Service Quality Metrics (SFQM) user guide <http://artifacts.opnfv.org/fastpathmetrics/colorado/index.html>`_
	
- `Bottlenecks user guide <http://artifacts.opnfv.org/bottlenecks/colorado/docs/installationprocedure/index.html>`_

