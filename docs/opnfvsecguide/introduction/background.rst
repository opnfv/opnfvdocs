Background
----------

Pre-virtualization security protection was largely centered on the network. Malicious attacks from hostile machines, would seek to exploit network based operating systems and applications, with the goal of compromising their target node. 

Physical security had always been a much simpler business, with most focus on the secure access of the data center hardware.
In-turn security was built up in layers (defense in depth) where machines would be daisy chained with network cables via  security appliances to provide controlled segmentation and isolation. This form of security was built upon the principle of an ‘air gap’ being present, whereby machines were separate physical units, joined largely by the network stack. 

With the advent of virtualization (namely the hypervisor), new attack vectors have surfaced as the ‘air-gap’ is no longer key design aspect for security. Further to this elements orchestation nodes and network controllers lead to an even wider attack surface: 

* Guests breaking isolation of the hypervisor.

* Unauthorized access and control of supporting orchestration nodes.

* Unauthorized access and control of supporting overlay network control systems. 

The hypervisor and the overlay network have now become the ‘Achilles heel’ whereby all tenant data isolation is enforced within the hypervisor and its abstraction of hardware and the virtualized overlay network.

This guide has been formulated, in order to assist users of the OPNFV platform in securing an Telco NFV / SDN environment.