======
SR-IOV
======

Single Root Input / Output Virtualization (SR-IOV), is a specification by the PCI-SIG organization. SR-IOV allows a single Peripheral Component Interconnect Express (PCIe) physical device under a single root port, to appear to be multiple separate physical devices to the hypervisor or guest virtual machine. This form of direct access (in comparison to a bridged interface) gives the same performance benefit of assigning a physical PCI device to a guest, however, it eliminates the need for multiple physical PCI devices, and the administrative complications of managing a large number of devices (these are typically NICs or HBAs, so there's cabling involved). Because the guest OS is effectively driving the hardware directly, the I/O performance is on par with bare metal performance. This provides a definite improvement over emulated I/O devices or paravirtual I/O devices.

SR-IOV provides physical functions (PFs) and virtual functions (VFs) to manage global functions for SR-IOV devices.

SR-IOV support is implemented in the kernel of the hypervisor, with driver support required for both the Physical Function (PF) and Virtual Function (VF) devices. SR-IOV must also be enabled in the compute units BIOS.

Security Considerations
~~~~~~~~~~~~~~~~~~~~~~~

Pause frame Denial of Service

If a SR-IOV enabled device has a single link to the edge switch, the device aggregates all traffic, both from the trusted host and from the untrusted guests, and sends it on the single shared link. As a result, untrusted guests can send any network frames to the edge switch. This trusted port aggregation means that it is possible for a untrusted VM to send MAC frame which carries a PAUSE frame. Priority-based flow control, as defined in the IEEE 802.1Qbb, allows an overwhelmed network node can send a PAUSE frame, which halts the transmission of the sender for a specified period of time.

Remediations

The pause frame attack was discovered by Igor Smolyar, Muli Ben-Yehuda, and Dan Tsafrir, Technion—Israel Institute of Technology and CVE was raised 12/2015 http://seclists.org/oss-sec/2015/q4/425, and subsequently hardware vendors such as Intel, Qlogic provided patched drivers. Thus it is recommended that the latest drivers be installed on the host system.

Another more rudimentary form of protection is to block flow control on the edge switch (or a similar role device), however this brings with it complications. Flow control can be used to mitigate TCP incast problems. TCP incast is a many-to-one communication pattern, typical in cloud and big data scenarios. A parent server could request update data or objects from multiple child nodes,  which receive the request simultaneously. the cluster of Nodes may in turn all synchronously respond to the singular Parent. The result is a micro burst of many machines simultaneously sending TCP data streams to one machine (many to one).
