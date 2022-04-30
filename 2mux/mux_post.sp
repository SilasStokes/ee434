

* The first line is always a comment line.
* Case-insensitive

* Control
.option post INGOLD=2

* Include the following file to load transistor models.
.include './45nm_PTM_HP_v2.1.pm'

* Parameters
.param Vsup = 1.0V

* Inverter. use NMOS_HP and PMOS_HP for NMOS and PMOS transistors.

* Transistor names should begin with "m".
* Format: <transistor name> <drain> <gate> <source> <body> <type> W L
*mn1 nOut nIn 0 0 NMOS_HP L=50n W=90n
*mp1 nOut nIn nVdd nVdd PMOS_HP L=50n W=140n

.include "mux_xRC.sp"

* Instantation. The instance name should begin with "X".
* The order of the ports should match the order of the ports in the definition.
* The last one is the name of the instance definition.
* X1 nIn nOut nVdd 0 MUX2_X1 
X1 nS nA nB nVdd 0 nOut  mux

* Output load capacitance. Capacitors should begin with "c".
* Format: <capacitor name> <node 1> <node 2> <value>
cout nOut 0 10f

* Power supply
* Format: <power supply name> <node 1> <node 2> <value>
VVdd nVdd 0 Vsup

* Input signal (independent voltage source)
* Format: <signal name> <node 1> <node 2> <signal>
* For the signal, we use a piecewise linear (PWL) source. Format: time1 value1 time2 value2 ...
Vsrc nIn 0 PWL 0p 0 200p 0 210p Vsup 1n Vsup 1.01n 0 2n 0

* Transient analysis. Simulate up to 2.5ns.
.tran 1p 2.5n

* Measure (fall time)
.measure TRAN tfall TRIG V(nOut) VAL=0.9 FALL=1 TARG V(nOut) VAL=0.1 FALL=1

* Measure (rise time)
.measure TRAN trise TRIG V(nOut) VAL=0.1 RISE=1 TARG V(nOut) VAL=0.9 RISE=1

.end

