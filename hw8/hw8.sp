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
* Format: 
*   name    drain   gate    source  body    type    L(Length)   W(Width)
    mn1     Y       A       VSS     VSS     NMOS_HP L=45n       W=50n
    mp1     Y       A       VDD     VDD     PMOS_HP L=45n       W=75n
.ends

.subckt myAnd A B Y VDD VSS
* PMOS:
    mp1     nout       A       VDD     VDD     PMOS_HP L=45n       W=75n
    mp2     nout       B       VDD     VDD     PMOS_HP L=45n       W=75n

* NMOS:
*   name    drain   gate    source  body    type    L(Length)   W(Width)
    mn1     nout       A       n1      VSS     NMOS_HP L=45n       W=100n
    mn2     n1         B       VSS     VSS     NMOS_HP L=45n       W=100n
* mn3 and mp3 will be inverter
*   subckt_inst_name    nodes               subckt_definition_name>
    X1                  nout Y VDD VSS        myInv
.ends

.subckt myOr A B Y VDD VSS
* PMOS:
*   name    drain       gate    source  body    type    L(Length)   W(Width)
    mp1     nout        A       n1      VDD     PMOS_HP L=45n       W=150n
    mp2     n1          B       VDD     VDD     PMOS_HP L=45n       W=150n

* NMOS:
*   name    drain   gate    source  body    type    L(Length)   W(Width)
    mn1     nout       A       VSS     VSS     NMOS_HP L=45n       W=50n
    mn2    nout       B       VSS     VSS     NMOS_HP L=45n       W=50n
* mn3 and mp3 will be inverter
*   subckt_inst_name    nodes               subckt_definition_name>
    X1                  nout Y VDD VSS        myInv
.ends

* Now, I "instantiate" two inverters.
* The name of a subckt instance should begin with "X".
* Format: <subckt instance name> <nodes> <subckt definition name>
* The order of the nodes should match the order of the ports in the subckt definition.
* Format: 
*   subckt_inst_name    nodes               	subckt_definition_name>
    * X1                  nInput n1 nVdd 0    myInv
    * X2                  n1 nOutput nVdd 0   myInv
    XAND1				nA nB n1 nVdd 0 		myAnd
    XAND2				nC nD n2 nVdd 0 		myAnd
	XOR1 				n1 n2 nOutput nVdd 0	myOr

* Load cap
C1 nOutput 0 10f

* Power supply
VVdd nVdd 0 Vsup

* Input signal
VA nA 0 PWL 0p 0 200p 0 210p Vsup 1n Vsup 1.01n 0 2.5n 0 2.51n Vsup 
VB nB 0 PWL 0p 0 400p 0 410p Vsup 1n Vsup 1.01n 0 2.5n 0 2.51n Vsup 
VC nC 0 PWL 0p 0 1.2n 0 1.21n Vsup 2n Vsup 2.01n 0 2.5n 0 2.51n Vsup 
VD nD 0 PWL 0p 0 1.4n 0 1.41n Vsup 2n Vsup 2.01n 0 2.5n 0 2.51n Vsup 

.tran 1p 3.2n

.end
