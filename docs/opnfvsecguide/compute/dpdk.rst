====
DPDK
====

The Data Plane Development Kit (DPDK) is a set of data plane libraries and network interface controller drivers for fast packet processing. The DPDK provides a programming framework for Intel x86 processors and enables faster development of high speed data packet networking applications. It scales from Intel Atom processors to Intel Xeon processors and support for other processor architectures like IBM POWER8 are under progress. It is provided and supported under the open source BSD license.

OPNFV Upstream Project: `DPACC <https://wiki.opnfv.org/dpacc>`_


Security Considerations
#######################

Multi-process Limitations
*************************

There are a number of limitations to what can be done when running DPDK multi-process applications. Some of these are documented below:

The multi-process feature requires that the exact same hugepage memory mappings be present in all applications. The Linux security feature - Address-Space Layout Randomization (ASLR) can interfere with this mapping, so it may be necessary to disable this feature in order to reliably run multi-process applications.

Disabling Address-Space Layout Randomization (ASLR) may have security implications, so it is recommended that it be disabled only when absolutely necessary, and only when the implications of this change have been understood.

For more details, refer to the DPDK documentation http://dpdk.org/doc/guides/prog_guide/multi_proc_support.html

Pause Frame Exploit
*******************

Pause frame exploits are currently not possible, due to flow controls being disabled in DPDK (as of time of writing).
