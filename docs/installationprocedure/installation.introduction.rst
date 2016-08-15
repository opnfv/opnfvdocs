.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Sofia Wallin Ericsson AB

******************************
OPNFV Installation Instruction
******************************

Abstract
--------
This document provides guidance and instructions for the installation of the OPNFV Colorado release.

The release includes four installer tools leveraging different technologies; Apex, Compass4nfv, Fuel and JOID, which deploy components of the platform.

This document provides a guide for the selection of tools and components including guidelines for how to deploy and configure the platform to an operational state.

============
Introduction
============
The OPNFV platform is based on 4 diffrent installers providing the same end system state but based on different installation technologies. OPNFV scenarios provide unique features and capabilities, it is important to understand your required target platform capabilities before installing and configuring your target scenario.
An OPNFV installation requires either a physical environment as defined in the Pharos lab specification, or a virtual infrastructure. When configuring a physical infrastructure it is strongly advised to follow the Pharos configuration material. 
<Pharosspec>

=========
Scenarios
=========
OPNFV provides a variety of virtual infrastructure deployments called scenarios designed to host virtualised network functions (VNF’s). Each scenario provide specific capabilities and/or components aimed to solve specific problems for the deployment of VNF’s. A scenario may include components such as OpenStack, OpenDaylight, OVS, KVM etc. where each scenario will include different source components or configurations.

<scenarioname>  

======================
Installation procedure
======================
<fuel>
<apex>
<compass4nfv>
<joid>

============================
Platform verfication
============================
After installing your specific deployment please make sure that you run the relevant tests suites.

<functest>
<yardstick>
