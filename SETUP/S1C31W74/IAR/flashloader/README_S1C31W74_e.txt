Flashloader for S1C31W74

    Copyright(C) SEIKO EPSON CORPORATION 2015-2016.

    History:
        28 SEP, 2015     ver beta-1
        18 DEC, 2015     ver beta-2
        26 FEB, 2016     ver 1.00
        21 Nov, 2016     ver 1.01
--------------------------------------------------------------------------------

FILE COMPOSITION
==============================================
- FlashS1C31W74_ext.out
- S1C31W74_ext.board
- S1C31W74_ext.flash
- FlashS1C31W74_int.out
- S1C31W74_int.board
- S1C31W74_int.flash
- README_S1C31W74_e.txt


CONTENTS
==============================================
1. About this software
2. How to configure
3. Time required for initial writing / erasure
4. Others
==============================================

1. About this software
This is flashloader software of S1C31W74 to erase / write its internal flash
memory. S1C31W74 is a microcontroller with ARM(R) Cortex(R)-M0+ processor, which
is a product of SEIKO EPSON CORPORATION.
The flashloader is used with IAR Embedded Workbench(R). Based on power source for
flashloader, the following 2 types of flashloaders are prepared.

1-1. Flashloader of its power supplied externally
This flashloader enables faster flash writing/erasure, see 3. below, with power
supplied externally.
The following are components of the flashloader.
    - FlashS1C31W74_ext.out
    - S1C31W74_ext.board
    - S1C31W74_ext.flash
When you use a S5U1C31001L1 Bridge Board, power for the flashloader is supplied
through it. See its user manual on S5U1C31001L1 Bridge Board in detail.

1-2. Flashloader of its power boosted internally
This flashloader works without supplying external power.
The following are components of the flashloader.
    - FlashS1C31W74_int.out
    - S1C31W74_int.board
    - S1C31W74_int.flash
The power for the flashloader is boosted internally in S1C31W74, so don't supply
power for the flashloader externally.


2. How to configure

2-1. Locate files
Before launching IAR Embedded Workbench(R), please locate flashloader software,
which is all files written above, at the following directory.
C:\Program Files (x86)\IAR Systems\Embedded Workbench 7.x\arm\config\flashloader\Epson

2-2. Configure .board file
If either of .board files above is not selected at [Project]-[Option]-[Debugger]-
[Download] on IAR Embedded Workbench(R), configure either of the files.

Please refer to "C-SPY(R) Debugging Guide" located below on how to configure and
use flashloaders in general.
C:\Program Files (x86)\IAR Systems\Embedded Workbench 7.x\arm\doc


3. Time required for initial writing / erasure
Measurement condition: Flash ROM is new.

3-1. Flashloader of its power supplied externally
      Initial writing: 75 sec (Typical)
      Initial erasure:  5 sec (Typical)

3-2. Flashloader of its power boosted internally
      Initial writing: 305 sec (Typical)
      Initial erasure:  20 sec (Typical)


4. Others

4-1. Copyright
Except for framework source codes used for the flashloaders, SEIKO EPSON CORPORATION
holds copyright on the flashloaders.

4-2. Version up
Please note that flashloaders may be updated without prior notice.

4-3. Attention
Interrupt, except for NMI, is disabled when flashloader is running to ensure its
erasure and writing.

4-4. Notice
ARM and Cortex are registered trademarks of ARM Limited in the EU and other
countries. All rights reserved.

----
