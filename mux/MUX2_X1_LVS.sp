* comment line
.GLOBAL VDD
.GLOBAL VSS

* .SUBCKT MUX2_X1 A ZN VDD VSS
* mn1 ZN A VSS VSS NMOS_HP L=0.05u W=0.09u
* mp1 ZN A VDD VDD PMOS_HP L=0.05u W=0.14u
* .ENDS 

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
	mp3 	net_1 		A 		VDD 	VDD 	PMOS_HP L=0.05u 	W=0.14u
	mp5 	nY_bar		B 		net_1	VDD 	PMOS_HP L=0.05u 	W=0.14u 
										* do I change body to VDD or net_1

* output inverter:
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
	mn3		nY_bar 		S		net_3	VSS		NMOS_HP	L=0.05u		W=0.09u 
										* might need to change body to net_2
* output inverter:
	mn6		Y			nY_bar	VSS		VSS		NMOS_HP	L=0.05u		W=0.09u
.ENDS 
