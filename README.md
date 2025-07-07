# EPICS makeBaseApp.pl Sample Use Case
This is to demonstrate some standard use cases for the EPICS **_makeBaseApp.pl_** utility. 

Note: In this document (and in the EPICS documentation and script output), the term IOC or IOC Application
gets commonly used to mean one of two things; the name of an IOC Application binary, and the name of a control system 
IOC. I find the lake of clear distinction between these to be confusing. I will try to be clear about which is
being used from here forward.

I did this experiment to try to finally learn what the tool does, and how to make some use of it.
The first big piece of information is the meaning behind the _-t type_ option. _type_ can be _example_ or _ioc_ ( as well as _caClient_, _support_, & _caPerl_)
. 
The _ioc_ option basically builds a skeleton framework for creating an IOC application binary of a specified name. 
The mystery distinction between that and the _example_ type is that the example type creates a collection of skeleton
codes for building things like records, device support, subroutine records, etc. All in one directory; you get 
to pick which skeleton you need to use for your use case, and (I guess) just discard the parts you don't need.

The other mystery solved is the _-i_ option to create an IOC boot directory tree. It wants to know what to call your 
IOC, typically representing some real world use case, like a control system for a beamline, experiment, device/subsystem, etc.
It also wants to know what IOC Application binary to use for the iocBoot tree. Naturally, these two things are 
distinct, although they don't have to be. In my experience, the IOC name reflects the control system use case, while the
IOC Application binary name reflects the types of EPICS Device Support that was used to build the application (making it
re-usable for multiple projects/use cases).

The log file here shows the effects of progressively adding makeBaseApp.pl invocations, and showing the effect on the 
respective directory tree.

## Observations
* The utility creates a directory structure fitted with enough content to allow building complete IOCs and other components.
* The directory tree contains a Makefile in the top directory level of the hierarchy, and that Makefile defines the **_$(TOP)_** directory. 
* Most of the content is inherited from the $(EPICS_BASE).

* In this sample, there are some EPICS oriented environment values present. These are created by a simple shell script that the author uses as a standard way to set up EPICS environements.*

    if [ -n "$1" ]; then
            export EPICS_CA_ADDR_LIST=$1
    else
            export EPICS_CA_ADDR_LIST=192.168.1.100
    fi
    #
    #       CaPerl needs $EPICS_HOST_ARCH
    #
    export EPICS_BASE=/home/bomr/epics/base-3.16/epics-base
    export EPICS_HOST_ARCH=linux-aarch64
    # export EPICS_HOST_ARCH=linux-x86_64
    export EPICS_CA_MAX_ARRAY_BYTES=5000000
    export EPICS_CA_AUTO_ADDR_LIST=YES
    export EPICS_CA_REPEATER_PORT=9101
    export EPICS_CA_SERVER_PORT=9102
    export CA_PERL=/usr1/release_lib/perl
    export PVconnections_PERL=/usr1/local/perllib/PVconnections
    ### Other EPICS stuff
    export EPICS_TS_MIN_WEST=480
    export EPICS_IOC_LOG_PORT=7004
    export EPICS_IOC_LOG_INET=192.168.1.100
    export EPICS_IOC_LOG_FILE_LIMIT=10000000
    export EPICS_IOC_LOG_FILE_NAME=/home/bomr/data/iocLog.text
    export EPICS_AR_PORT=7002
    # export TRAR_ARCHIVE_DIRECTORY="home/bomr/data/arch"

