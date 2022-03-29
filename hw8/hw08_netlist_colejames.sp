* The first line is always a comment line.
* Case-sensitive

* Control
.option post INGOLD=2

* Include the following file to load transistor models
.include './45nm_PTM_HP_v2.1.pm'

* Parameters
* Supply voltage
.param Vsup = 1.0V

* A subckt definition for an AND gate
* Format: .subckt <subckt name> <ports>
.subckt myAND A B YAB VDD VSS
mn1 nabn B VSS VSS NMOS_HP L=45n W=100n
mn2 YinvAB A nabn VSS NMOS_HP L=45n W=100n
mn3 YAB YinvAB VSS VSS NMOS_HP L=45n W=50n

mp1 YinvAB B VDD VDD PMOS_HP L=45n W=75n
mp2 YinvAB A VDD VDD PMOS_HP L=45n W=75n
mp3 YAB YinvAB VDD VDD PMOS_HP L=45n W=75n
.ends

* A subckt definition for an OR gate
* Format: .subckt <subckt name> <ports>
.subckt myOR C D YCD VDD VSS
mn4 YinvCD C VSS VSS NMOS_HP L=45n W=50n
mn5 YinvCD D VSS VSS NMOS_HP L=45n W=50n
mn6 YCD YinvCD VSS VSS NMOS_HP L=45n W=50n

mp4 nabp C VDD VDD PMOS_HP L=45n W=150n
mp5 YinvCD B nabp VDD PMOS_HP L=45n W=150n
mp6 YCD YinvCD VDD VDD PMOS_HP L=45n W=75n
.ends


* Instantiating sub-circuits
* The name of the subckt should begin with an "X"
* Format: <subckt instance name> <nodes> <subckt defintion name>
* The order of the nodes should match the order of the ports in the subckt 
definiton
X1 nA nB nAND2u nVdd 0 myAND
X2 nC nD nAND2l nVdd 0 myAND
X3 nAND2u nAND2l nY VDD 0 myOR

* Capacitor
* Format follows: cap_name positive_node negative_node value
cY nY 0 10f

* Voltage Sources
* Format follows: name positive_node negative_node value
VVdd nVdd 0 Vsup

* Waveform properties
* Format follows: voltage_source_name positive_node negative_node PWL
VA nA 0 PWL 0p 0 200p 0 210p Vsup 1n Vsup 1.01n 0 2.5n 0 2.51n Vsup
VB nB 0 PWL 0p 0 400p 0 410p Vsup 1n Vsup 1.01n 0 2.5n 0 2.51n Vsup
VC nC 0 PWL 0p 0 1.2n 0 1.21n Vsup 2n Vsup 2.01n 0 2.5n 0 2.51n Vsup
VD nD 0 PWL 0p 0 1.4n 0 1.41n Vsup 2n Vsup 2.01n 0 2.5n 0 2.51n Vsup

* Transient analysis
* Format follows: time_step duration
.tran 1p 3.2n

* End of file
.end
