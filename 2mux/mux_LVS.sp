* comment line
.GLOBAL VDD
.GLOBAL VSS

.SUBCKT mux S A B VDD VSS Y
* .SUBCKT mux A B S Y VDD VSS
* PMOS:
*   name    drain       gate    source  body    type    L(Length)   W(Width)
* s - inverter
	mp1 	nS_bar		S 		VDD 	VDD 	PMOS_HP L=0.05u 	W=0.27u
* left mux logic
	mp2 	net_1 		nS_bar  VDD 	VDD 	PMOS_HP L=0.05u 	W=0.27u
	mp3 	nY_bar		S 		net_1	VDD 	PMOS_HP L=0.05u 	W=0.27u
										* do I change body to VDD or net_1
* right mux logic
	mp4 	net_1 		A 		VDD 	VDD 	PMOS_HP L=0.05u 	W=0.27u
	mp5 	nY_bar		B 		net_1	VDD 	PMOS_HP L=0.05u 	W=0.27u
* output inverter:
	*mp6		Y			nY_bar	VDD		VDD		PMOS_HP L=0.05u 	W=0.14u
	mp6		Y			nY_bar	VDD		VDD		PMOS_HP L=0.05u 	W=0.09u


* NMOS:
*   name    drain   	gate    source  body    type    L(Length)   W(Width)
* s - inverter
	mn1		nS_bar		S		VSS		VSS		NMOS_HP	L=0.05u		W=0.105u
* left mux logic
	mn2		net_2		nS_bar	VSS		VSS		NMOS_HP	L=0.05u		W=0.105u
	mn3		nY_bar 		A		net_2	VSS		NMOS_HP	L=0.05u		W=0.105u 
										* might need to change body to net_2
* right mux logic
	mn4		net_3		B		VSS		VSS		NMOS_HP	L=0.05u		W=0.105u
	mn5		nY_bar 		S		net_3	VSS		NMOS_HP	L=0.05u		W=0.105u 
										* might need to change body to net_2
* output inverter:
	mn6		Y			nY_bar	VSS		VSS		NMOS_HP	L=0.05u		W=0.105u
.ENDS 
