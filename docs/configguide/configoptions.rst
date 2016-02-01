.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Christopher Price (Ericsson AB)

=====================
Configuration Options
=====================

OPNFV provides a variety of virtual infrastructure deployments called scenarios designed to
host virtualised network functions (VNF's).  Each scenario provide specific capabilities and/or
components aimed to solve specific problems for the deployment of VNF's.  A scenario may include
components such as OpenStack, OpenDaylight, OVS, KVM etc. where each scenario will
include different source components or configurations.

OPNFV Scenario's
================

Each OPNFV scenario provides unique features and capabilities, it is important to understand
your target platform capabilities before installing and configuring your target scenario.
This configuration guide outlines how to install and configure components in order to enable
the features you require.

.. include:: ../scenario/scenariomatrix.rst

This document will describe how to install and configure your target OPNFV scenarios.
Remember to check the associated validation procedures section following your installation for
details of the use cases and tests that have been run.
