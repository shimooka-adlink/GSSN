========================
Epson S1C31W74 Software
========================


This software package contains:
- S1C31W74 product files
- S1C31W74 example source files
- S1C31W74 peripheral software library


IMPORTANT
=========

Absence of the SETUP\S1C31W74\IAR folder means that all product files in the IAR Toolkit 
subdirectories are up to date.

When the SETUP\S1C31W74\IAR folder is present - some service files must to be copied into 
various locations in the directory that the IAR Toolkit program was installed.  
This directory is typically:

  C:\Program Files (x86)\IAR Systems\Embedded Workbench 7.5

A batch file is provided to help do this in the SETUP\S1C31W74\IAR subdirectory,
however, you may need to modify the value for IAR_EMBEDDED_WORKBENCH_FOR_ARM in
setup-iar.bat to match the version of IAR Toolkit that you are using.  Currently,
it is set to version 7.80.4.

To run setup-iar.bat, right-click on setup-iar.bat and "Run as administrator" and ensure
visually that no errors occur.  If "Run as administrator" option does not exist,
then run "cmd" as an administrator and execute setup-iar.bat that way.


EWARM VERSION
=============
Software in this package was evaluated by EWARM ver 7.80.4  The project files saved by ver. 7.80.4


GETTING STARTED
===============

To run the Examples provided with the software, perform the following steps: 

1. Run the IAR IDE, navigate to the Examples\WORKSPACE\S5U1C31W74T1\IAR directory and open Examples.eww
workspace.

2. The batch build (F8) is available to rebuild following configurations:

  all_Debug        - A debug build to executing from RAM
  all_DebugFlash   - A debug build to executing from Flash
  all_ReleaseFlash - A release build to executing from Flash

3. Select various targets, for example, the "LCD32B - Debug" target from the
drop down menu list.

4. Connect the S1C31W74 board to the PC host via ARM(R) debug probe and optional 
S5U1C31001L1 Bridge Board. Bridge Board is used to facilitate faster flash programming 
by supplying a VPP of 7.5V. 

5. Download selected target's firmware to the board and execute.
NOTE 1: [
When Downloading to the target using J-Link adapter probe - a pop-up box may appear that says 
'The selected device "S1C31W74" is unknown to this version of the J-Link software.'
   Select from the list the Manufacturer "Unspecified" and Device "Cortex-M0+".
]

Note 2: [ 
For the Debug targets the "Use flash loader(s)" tick button on the Option->Debugger->Download 
is not selected.
For Flash targets the "Use flash loader(s)" tick button is selected. 
Also selected are appropriate board files in Options->Debugger->Download.

S1C31W74_int.board shall be selected when power boosted internally.
S1C31W74_ext.board shall be selected when power boosted externally.
]

DIRECTORY STRUCTURE
===================

Root directory
  board\S5U1C31W74T1------------Contains files for the board configuration
  CMSIS-------------------------Contains files related to ARM(R) CMSIS
  Documentation-----------------Contains Doxygen documentation
  SETUP\S1C31W74\IAR------------Contains Epson S1C31W74 IAR configuration files
  Licenses----------------------Contains open source licenses
  seGraphicsLibrary-------------S1C31W74 LCD drawing library
  sePeriphLibrary---------------S1C31W74 peripheral library
  Tools-------------------------Contains tools for the sample software
  USBStack----------------------A part of CMSIS-DAP Interface Firmware, ARM(R).
		                This software is licensed under the Apache License. 
  Examples----------------------Example code for various peripheral modules



ARM and Cortex are registered trademarks of ARM Limited (or its subsidiaries) in the EU and/or elsewhere. All rights reserved.


