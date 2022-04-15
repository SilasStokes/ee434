* comment line
* The first line is always a comment line.
* Case-insensitive

* Control
.option post INGOLD=2

* Include the following file to load transistor models.
.include './45nm_PTM_HP_v2.1.pm'

* Supply voltage
.param Vsup = 1.0V


* .GLOBAL VDD
* .GLOBAL VSS

.SUBCKT MUX2_X1 A B S Y VDD VSS
* PMOS:
*   name    drain       gate    source  body    type    L(Length)   W(Width)
* s - inverter
	mp1 	nS_bar		S 		VDD 	VDD 	PMOS_HP L=0.05u 	W=0.14u
* left mux logic
	mp2 	net_1 		nS_bar  VDD 	VDD 	PMOS_HP L=0.05u 	W=0.14u
	mp3 	nY_bar		S 		net_1	VDD 	PMOS_HP L=0.05u 	W=0.14u 
										* do I change body to VDD or net_1
* right mux logic
	mp4 	net_1 		A 		VDD 	VDD 	PMOS_HP L=0.05u 	W=0.14u
	mp5 	nY_bar		B 		net_1	VDD 	PMOS_HP L=0.05u 	W=0.14u 
										* do I change body to VDD or net_1

* output inverter:
	*mp6		Y			nY_bar	VDD		VDD		PMOS_HP L=0.05u 	W=0.14u
	mp6		Y			nY_bar	VDD		VDD		PMOS_HP L=0.05u 	W=0.14u

* NMOS:
*   name    drain   	gate    source  body    type    L(Length)   W(Width)
* s - inverter
	mn1		nS_bar		S		VSS		VSS		NMOS_HP	L=0.05u		W=0.09u
* left mux logic
	mn2		net_2		nS_bar	VSS		VSS		NMOS_HP	L=0.05u		W=0.09u
	mn3		nY_bar 		A		net_2	VSS		NMOS_HP	L=0.05u		W=0.09u 
										* might need to change body to net_2
* right mux logic
	mn4		net_3		B		VSS		VSS		NMOS_HP	L=0.05u		W=0.09u
	mn5		nY_bar 		S		net_3	VSS		NMOS_HP	L=0.05u		W=0.9u 
										* might need to change body to net_2
* output inverter:
	mn6		Y			nY_bar	VSS		VSS		NMOS_HP	L=0.05u		W=0.09u
.ENDS 

X1 nA nB nS nOut nVDD 0 MUX2_X1

* Load cap
*** Output load capacitance. Capacitors should begin with "c".
* Format: <capacitor name> <node 1> <node 2> <value>
C1 nOut 0 10f

* Power supply
VVdd nVdd 0 Vsup

* Input signal
* Format: <signal name> <node 1> <node 2> <signal>
* For the signal, we use a piecewise linear (PWL) source. Format: ... PWL time1 value1 time2 value2 ...
* Vsrc nInput 0 PWL 0p 0 200p 0 210p Vsup 1n Vsup 1.01n 0 2n 0 2.01n Vsup
VA nA 0 PWL 0p 0 400p 0 410p Vsup 800p Vsup 810p 0 2.4n 0 2.41n Vsup 2.8n Vsup 2.81n 0 
VB nB 0 PWL 0p 0 1200p 0 1210p Vsup 1600p Vsup 1610p 0 3.2n 0 3.21n Vsup 3.6n Vsup 3.61n 0 
VS nS 0 PWL 0p 0 2n 0 2.01n Vsup

* VC nC 0 PWL 0p 0 1.2n 0 1.21n Vsup 2n Vsup 2.01n 0 2.5n 0 2.51n Vsup 
* VD nD 0 PWL 0p 0 1.4n 0 1.41n Vsup 2n Vsup 2.01n 0 2.5n 0 2.51n Vsup 

* Transient analysis. Simulate up to 2.5ns.
.tran 1p 4n

.end