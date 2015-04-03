:title: Project Name: Documentation

Project Name: Documentation
============================

- Proposed name for the project: ''opnfv documentation''
- Proposed name for the repository: ''opnfvdocs''
- Project Categories: Documentation

Project description:
---------------------

- Produce documentation for OPNFV releases including but not limited to:

  - Release notes
  - Installation guide
  - User guide

    - Any relevant references and interface specifications for OPNFV projects or components.

  - Include any architecture diagrams or specifications, reference to OPNFV requirements list.
  - Provide guidelines and tooling for documentation handling across all OPNFV projects 

Scope:
-------

- Set up a structure, and a template, for document development with source control (same as source code). Leveraging upstream documentation structure and tools.
- Following as close as possible the same contribution process & tools as our source code
- Structure OPNFV documentation logically
- Develop initial set of release documents: 

  - (A) Release note
  - (B) Install guide
  - (C) User Guide
  - (D) API reference (if there is content in release 1)
  - (E) Interface specification  (if there is content in release 1)

- Provide language options for documentation where applicable: In first release English only, Wiki (via HTML scraping from Gerrit), and PDF.
- Provide tooling and processes for OPNFV projects to implement and follow for consistency

Dependencies:
--------------

- All OPNFV projects participating in a release.
- Upstream project documentation to be referenced 
- Where there are external fora or standard development organization dependencies, list informative and normative references & specifications.


Committers and Contributors:
-----------------------------

- Name of and affiliation of the project leader :

  - Christopher Price: christopher.price@ericsson.com 

- Names and affiliations of the committers 

  - Christopher Price: christopher.price@ericsson.com 
  - Wenjing Chu (Dell):  wenjing_chu@dell.com 
  - Ashiq Khan (NTTdocomo): khan@nttdocomo.com 
  - Fatih Degirmenci: fatih.degirmenci@ericsson.com 
  - Rodriguez, Iben: Iben.Rodriguez@spirent.com 
  - Malla Reddy Sama: sama@docomolab-euro.com 

- Any other contributors 

  - Bryan Sullivan (AT&T) 
  - Trevor Cooper: trevor.cooper@intel.com 


Description of roles in the documentation project:

- Committers (Editors): has overall responsibility of document structure, editing, style and toolchains
- opnfvdocs contributors: individual section will have contributors who are domain experts in those areas, other contributors may simply help out working on the documentation and tools as needed.
- other projects: Committers will be responsible for maintaining documentation artifacts in project repositories.

Planned deliverables
---------------------

- Project release documentation for OPNFV

  - Including collation of all release relevant project documentations

- Establishment and maintenance of the OPNFV documentation processes and toolchains


Proposed Release Schedule:
---------------------------

- opnfvdocs will follow each OPNFV release and produce needed documentation

  - Release 1 will provide basic documentation including revision control.
  - By release 2 a multi-project toolchain will be in place with processes and version control
  - Iterative improvements to the processes and toolchains are expected on a release by release basis.


