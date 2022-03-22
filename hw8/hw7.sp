* The first line is always a comment line.
* Case-insensitive

* Control
.option post INGOLD=2

* Include the following file to load transistor models.
.include './45nm_PTM_HP_v2.1.pm'

* Parameters
* Supply voltage
.param Vsup = 1.0V

* Inverter. use NMOS_HP and PMOS_HP for NMOS and PMOS transistors.

*** Transistor names should begin with "m".
*** Use "nXXXXX" for node names.
*** Use 0 for the ground.
* Format: <transistor name> <drain> <gate> <source> <body> <type> L(Length) W(Width)
* mn1 nOut nIn 0 0 NMOS_HP L=45n W=50n
* mp1 nOut nIn nVdd nVdd PMOS_HP L=45n W=75n
* NEED 3 mn, 3 mp
* Format: <transistor name>     <drain>     <gate>  <source>    <body>  <type>  L(Length)   W(Width)
            mn1                 nY          nA      nn1         0       NMOS_HP L=45n       W=50n
            mn2                 nn1         nB      0           0       NMOS_HP L=45n       W=50n
            mn3                 nn1         nC      0           0       NMOS_HP L=45n       W=50n

            mp1                 nY          nA      nVdd        nVdd    PMOS_HP L=45n       W=75n
            mp2                 np1         nB      nVdd        nVdd    PMOS_HP L=45n       W=75n
            mp3                 nY          nC      np1         nVdd    PMOS_HP L=45n       W=75n


*** Output load capacitance. Capacitors should begin with "c".
* Format: <capacitor name> <node 1> <node 2> <value>
cout nOut 0 10f

* Power supply
* Format: <power supply name> <node 1> <node 2> <value>
*** Voltage source names should begin with "v".
*<power supply name>    <node 1>    <node 2>    <value>
    VVdd                nVdd        0           Vsup

* Input signal (independent voltage source)
* Format: <signal name> <node 1> <node 2> <signal>
* For the signal, we use a piecewise linear (PWL) source. Format: ... PWL time1 value1 time2 value2 ...
* Vsrc nIn 0 PWL 0p 0 200p 0 210p Vsup 1n Vsup 1.01n 0 2n 0

*           t1 v1t2v2 t3    v3   t4 v4   t5    v5
VA nA 0 PWL 0p 0 1n 0 5n 0 5.01n Vsup 9n Vsup 9.01n 0
VB nB 0 PWL 0p 0 1n 0   3n 0 3.01n Vsup     5n Vsup 5.01n 0     7n 0 7.01n Vsup      9n Vsup 9.01n 0
* VB nB 0 PWL 0p 0 1n 0 5n 0 5.01n Vsup 9n Vsup 9.01n 0
VC nC 0 PWL 0p 0 1n 0 2n 0 2.01n Vsup 3n Vsup 3.01n 0 4n 0 4.01n Vsup 5n Vsup 5.01n 0 6n 0 6.01n Vsup 7n Vsup 7.01n 0 8n 0 8.01n Vsup 9n Vsup 9.01n 0
* VC nC 0 PWL 0p 0 1n 0 5n 0 5.01n Vsup 9n Vsup 9.01n 0


* VA nA 0 PWL 0p 0 1n 0 1.01n Vsup 3n Vsup 3.01n 0
* VB nB 0 PWL 0p 0 2n 0 2.01n Vsup 4n Vsup 4.01n 0
* VC nC 0 PWL 0p 0

* Transient analysis. Simulate up to 2.5ns.
.tran 1p 10n

.end