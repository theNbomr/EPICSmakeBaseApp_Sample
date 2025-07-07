#!../../bin/linux-aarch64/GenericStream

#- SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change GenericStream to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/GenericStream.dbd"
GenericStream_registerRecordDeviceDriver pdbbase

## Load record instances
#dbLoadRecords("db/GenericStream.db","user=bomr")

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncxxx,"user=bomr"
