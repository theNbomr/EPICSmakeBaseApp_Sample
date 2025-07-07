
This is to demonstrate some standard use cases for the EPICS makeBaseApp.pl utility. 

I did this experiment to try to finally learn what the tool does, and how to make some use of it.
The first big piece of information is the meaning behind the -t <type> option. <type> can be example or ioc. 
The ioc option basically builds a skeleton frsamework for creating an IOC application of a specified name. 
The mystery distinction between that and the example type is that the example type creates a collection of skeleton
codes for building things like records, device support, subroutine records, etc. All in one directory; you get 
to pick which skeleton you need to use for your use case, and (I guess) just discard the parts you don't need.

The other mystery solved is the -i option to create an IOC boot directory tree. It wants to know what to call your 
IOC, typically representing some real world use case, like a control system for a beamline, experiment, device/subsystem, etc.
It also wants to know what IOC Application binary to use for the iocBoot tree. Naturally, these two things are 
distinct, although they don't have to be. In my experience, the IOC name reflects the control system use case, while the
IOC Application binary name reflects the types of EPICS Device Support that was used to build the application (making it
re-usable for multiple projects/use cases).

This log file here shows the effects of progressively adding makeBaseApp.pl invocations, and showing the effect on the 
respective directory tree.

