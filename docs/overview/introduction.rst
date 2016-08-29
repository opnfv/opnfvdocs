.. This work is licensed under a Creative Commons Attribution 4.0 International License.
.. http://creativecommons.org/licenses/by/4.0
.. (c) Open Platform for NFV Project, Inc. and its contributors

============
Introduction
============

OPNFV is a carrier-grade, integrated, open source platform to accelerate the introduction
of new NFV products and services. As an open source project, OPNFV strives
to bring together the work of standards bodies, open source communities and commercial
suppliers to deliver a de facto standard open source NFV platform for the industry.

By integrating components from upstream projects, the community is able to perform performance
and use case-based testing on a variety of solutions to ensure the platform’s suitability for
NFV use cases. OPNFV also works upstream with other open source communities to bring both contributions
and learnings from its work directly to those communities in the form of blueprints, patches,
and new code.

OPNFV initially focused on building NFV Infrastructure (NFVI) and Virtualized Infrastructure
Management (VIM) by integrating components from upstream projects such as OpenDaylight,
OpenStack, Ceph Storage, KVM, Open vSwitch, and Linux.
More recetly OPNFV has extended it's portfolio of forwarding soluitons to include fd.io and ODP,
is able to run on both Intel and ARM commercial & white-box hardwares, and includes
MANO components primarily for application composition and management in the Colorado release.

These capabilities, along with application programmable interfaces (APIs) to other NFV
elements, form the basic infrastructure required for Virtualized Network Functions (VNF)
and Management and Network Orchestration (MANO) components.

Concentrating on these components while also considering proposed projects on additional
topics (such as the MANO components and applciations themselves), OPNFV aims to enhance
NFV services by increasing performance and power efficiency, improving reliability,
availability and serviceability, and delivering comprehensive platform instrumentation.




OPNFV’s goals are to:

Develop an integrated and tested open source platform that can be used to build NFV functionality, accelerating the introduction of new products and services
Include participation of leading end users to validate OPNFV meets the needs of user community
Contribute to and participate in relevant open source projects that will be leveraged in the OPNFV platform; ensure consistency, performance and interoperability among open source components
Establish an ecosystem for NFV solutions based on open standards and software to meet the needs of end users
Promote OPNFV as the preferred platform and community for open source NFV



Fostering a diverse community of developers who bring different needs, ideas and knowledge
to the table means faster time to market and stronger code.






The primary goal of the OPNFV project is the development of an NVFi software platform, an integrated
solution using derived open source components of the ETSI ISG NFV reference architecture.

To achieve this, the OPNFV collaborative project fosters an open source community who share a common vision
to accelerate NFV readiness and maturity by promoting the development and evolution of NFV components.
The community achieves this goal by developing needed features and capabilities in open
source projects and conducting system level integration, deployment, and testing to create a
reference NFV platform and methodology.

Acknowledging the diveristy of industry implementations for these key platform components, the OPNFV community
has elected not to constrain the implementation of the patform to a singular methodology and approach.
The ability, and need, for platform users to adopt different components and capabilities has lead to
the community defining an integration methodology developed to accomodate a variety of use cases and
components.

meritocratic
The Colorado release
OPNFV users will be able to deploy their VNFs there using some MANO solution.
The target software platform is integrated from a set of other open source components,
of which the biggest ones are OpenStack and SDN controllers. There are multiple combinations
possible and a subset is provided and tested by the Brahmaputra release. These subsets
are called here scenarios.

Besides the target software platform, OPNFV provides a set of tools that helps the user
deploy this target software platform on a set of servers. These tools are installers.
Brahmaputra provides multiple options here. Naturally the different installers
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


