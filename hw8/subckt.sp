* The first line is always a comment line.
* Case-insensitive

* Control
.option post INGOLD=2

* Include the following file to load transistor models.
.include './45nm_PTM_HP_v2.1.pm'

* Supply voltage
.param Vsup = 1.0V

* A subckt definition for an inverter.
* Format: .subckt <subckt name> <ports>
.subckt myInv A Y VDD VSS
mn1 Y A VSS VSS NMOS_HP L=45n W=50n
mp1 Y A VDD VDD PMOS_HP L=45n W=75n
.ends

* Now, I "instantiate" two inverters.
* The name of a subckt instance should begin with "X".
* Format: <subckt instance name> <nodes> <subckt definition name>
* The order of the nodes should match the order of the ports in the subckt definition.
X1 nInput n1 nVdd 0 myInv
X2 n1 nOutput nVdd 0 myInv

* Load cap
C1 nOutput 0 10f

* Power supply
VVdd nVdd 0 Vsup

* Input signal
Vsrc nInput 0 PWL 0p 0 200p 0 210p Vsup 1n Vsup 1.01n 0 2n 0 2.01n Vsup

* Transient analysis. Simulate up to 2.5ns.
.tran 1p 3n

.end
