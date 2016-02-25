.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Christopher Price (Ericsson AB)

========
Overview
========

OPNFV provides a variety of virtual infrastructure deployments designed to
host virtualised network functions (VNFs).  This guide intends to help users of
the platform leverage the features and capabilities delivered by the OPNFV project.

OPNFV Continuous Integration builds, deploys and tests combinations of virtual
infrastructure components in what are defined as scenarios.  A scenario may include
components such as OpenStack, OpenDaylight, OVS, KVM etc. where each scenario will
include different source components or configurations.  Scenarios are designed to
enable specific features and capabilities in the platform that can be leveraged by the
OPNFV user community.

OPNFV Features
==============

Each OPNFV scenario provides unique features and capabilities, it is important to
ensure you have a scenario deployed on your infrastructure that provides the right capabilities
for your needs before working through the user guide.

This user guide outlines how to work with key components and features in the platform,
each feature description section will indicate the scenarios that provide the components
and configurations required to use it.

.. include:: ../scenario/featurematrix.rst

For details on which scenarios are best for you and how to install and configure them
on your infrastructure the
`OPNFV Configuration Guide <http://artifacts.opnfv.org/opnfvdocs/brahmaputra/docs/configguide/index.html>`_
provides a valuable reference.

The user guide will describe how to enable and utilise features and use cases implemented and
tested on deployed OPNFV scenarios.  For details of the use cases and tests that have been run
you should check the validation procedures section of the
`OPNFV Configuration Guide <http://artifacts.opnfv.org/opnfvdocs/brahmaputra/docs/configguide/post-install.html>`_.
This will provide information about the specific use cases that have been validated and are working on your deployment.

General usage guidelines
========================

The user guide for OPNFV features and capabilities provide step by step instructions
for using features that have been configured according to the installation and configuration
instructions.

This guide is structured in a manner that will provide usage instructions for each feature in its own
section.  Start by identifying the feature capability you would like to leverage, then read through
the relevant user guide section to understand how to work with the feature.
The combination of platform features, if available in a given scenario and not otherwise indicated,
should operate according to the documentation.
Dependencies between features will be highlighted in the user guide text.

You may wish to use the platform in a manner that the development teams have not foreseen, or
exercise capabilities not fully validated on the platform.  If you experience issues leveraging the
platform for the uses you have envisioned, the `OPNFV user mailing list <"mailto:opnfv-user@lists.opnfv.org">`_
provides a mechanism to establish a dialog with the community to help you overcome any issues identified.

It may be that you have identified a bug in the system, or that you are trying to execute a use case
that has not yet been implemented.  In either case it is important for OPNFV to learn about it as we are in
essence a development project looking to ensure the required capabilities for our users are available.
