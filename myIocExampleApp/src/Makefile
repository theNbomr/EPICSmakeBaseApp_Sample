# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = myIocExample
# myIocExample.dbd will be created and installed
DBD += myIocExample.dbd

# myIocExample.dbd will be made up from these files:
myIocExample_DBD += base.dbd

# Include dbd files from all support applications:
#myIocExample_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#myIocExample_LIBS += xxx

# myIocExample_registerRecordDeviceDriver.cpp derives from myIocExample.dbd
myIocExample_SRCS += myIocExample_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
myIocExample_SRCS_DEFAULT += myIocExampleMain.cpp
myIocExample_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#myIocExample_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
myIocExample_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

