.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) OPNFV, Huawei

.. ==> All actions still to be resolved during the review are marked "==>" in comments.

============
Introduction
============

.. ==> take some more inputs from the marketing message

OPNFV is an integration effort that takes outputs from several open source communities to build a NFV platform. This task of integration leads to providing different kinds of output to its users.

The primary goal of the OPNFV project is the target software platform, which is a integrated solution
of a set of components/building blocks of the ETSI ISG NFV reference architecture.
In the Brahmaputra release, this is limited to the NFVI and VIM blocks.
OPNFV users will be able to deploy their VNFs there using some MANO solution.
The target software platform is integrated from a set of other open source components,
of which the biggest ones are OpenStack and SDN controllers. There are multiple combinations
possible and a subset is provided and tested by the Brahmaputra release. These subsets
are called here scenarios.

Besides the target software platform, OPNFV provides a set of tools that helps the user
deploy this target software platform on a set of servers. These tools are called
**installers**. Brahmaputra provides multiple options here. Naturally the different installers
have different capabilities, that is they support deployment of different scenarios.

The installers allow users to deploy OPNFV target software platform on a bare metal environment
or a set of virtual machines. In both cases, some hosts (bare metal or virtual) will act
as controller nodes, while other hosts will be the compute nodes hosting the VNFs.
The installers use a separate server to control the deployment process. This server is called
"jump server" and is installed with the installer's software at the beginning of a deployment.
The jump server also can be bare metal or virtual.

This configuration - jump servers and a set of typically 5 nodes to run the target software platform -
is also described as part of an OPNFV release. This allows the users to build their own labs
accordingly and deploy OPNFV easily. A lab compliant to this description sometimes is called
"Pharos-compliant" after the OPNFV project providing the lab description.

Another major part of the OPNFV release is a testing framework and test cases.
This test framework allows users to verify their deployment of the OPNFV target software platform.
It will execute and test major functions of the platform relevant to NFV applications (VNFs) so
the user can be confident that VNFs can successfully run.

OPNFV releases come with the necessary documentation describing
target software platform, deployment tools, test cases, etc. in their architecture, configuration and usage.
The most important documents here are configuration guides and user guides that help to set up
a OPNFV deployment and use it.

The OPNFV project takes major effort to provide lab environments to the community.
The OPNFV community labs of course need to be Pharos-compliant. They are used for OPNFV development
tasks and release creation, but should also provide users with the opportunity to run their own
OPNFV tests. OPNFV community labs are not part of a OPNFV release.
Please find more information on the labs in the
`Pharos project documentation <http://artifacts.opnfv.org/pharos/brahmaputra/docs/index.html>`_.

We should also mention that OPNFV works on requirements of open source projects used in OPNFV to
make these projects better suitable for NFV telco carrier use cases.
These requirements are described in requirement documents and also forwarded
to the "upstream" projects in the format required by these projects.
These requirement documents are not bound to OPNFV releases.

OPNFV bundles the target software, installers, documentation, test cases and lab
description to releases.

This overview document introduces these components and scenarios on a high level and
points you to more detailed documentation.


