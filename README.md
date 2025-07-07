# EPICS makeBaseApp.pl Sample Use Case
This is to demonstrate some standard use cases for the EPICS **_makeBaseApp.pl_** utility. 

Note: In this document (and in the EPICS documentation and script output), the term IOC or IOC Application
gets commonly used to mean one of two things; the name of an IOC Application binary, and the name of a control system 
IOC. I find the lake of clear distinction between these to be confusing. I will try to be clear about which is
being used from here forward.

I did this experiment to try to finally learn what the tool does, and how to make some use of it.
The first big piece of information is the meaning behind the _-t type_ option. _type_ can be _example_ or _ioc_. 
The _ioc_ option basically builds a skeleton frsamework for creating an IOC application binary of a specified name. 
The mystery distinction between that and the _example_ type is that the example type creates a collection of skeleton
codes for building things like records, device support, subroutine records, etc. All in one directory; you get 
to pick which skeleton you need to use for your use case, and (I guess) just discard the parts you don't need.

The other mystery solved is the _-i_ option to create an IOC boot directory tree. It wants to know what to call your 
IOC, typically representing some real world use case, like a control system for a beamline, experiment, device/subsystem, etc.
It also wants to know what IOC Application binary to use for the iocBoot tree. Naturally, these two things are 
distinct, although they don't have to be. In my experience, the IOC name reflects the control system use case, while the
IOC Application binary name reflects the types of EPICS Device Support that was used to build the application (making it
re-usable for multiple projects/use cases).

This log file here shows the effects of progressively adding makeBaseApp.pl invocations, and showing the effect on the 
respective directory tree.

