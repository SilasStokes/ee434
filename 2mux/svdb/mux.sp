* SPICE NETLIST
***************************************

.SUBCKT mux S A B VDD VSS Y
** N=11 EP=6 IP=0 FDC=12
M0 VSS S 1 VSS NMOS_HP L=5e-08 W=1.05e-07 AD=1.47e-14 AS=1.6275e-14 PD=4.9e-07 PS=5.2e-07 $X=295 $Y=-1635 $D=1
M1 10 1 VSS VSS NMOS_HP L=5e-08 W=1.05e-07 AD=1.47e-14 AS=1.47e-14 PD=4.9e-07 PS=4.9e-07 $X=485 $Y=-1635 $D=1
M2 4 A 10 VSS NMOS_HP L=5e-08 W=1.05e-07 AD=1.47e-14 AS=1.47e-14 PD=4.9e-07 PS=4.9e-07 $X=675 $Y=-1635 $D=1
M3 11 S 4 VSS NMOS_HP L=5e-08 W=1.05e-07 AD=1.47e-14 AS=1.47e-14 PD=4.9e-07 PS=4.9e-07 $X=865 $Y=-1635 $D=1
M4 VSS B 11 VSS NMOS_HP L=5e-08 W=1.05e-07 AD=1.26e-14 AS=1.47e-14 PD=4.5e-07 PS=4.9e-07 $X=1055 $Y=-1635 $D=1
M5 Y 4 VSS VSS NMOS_HP L=5e-08 W=1.05e-07 AD=1.1025e-14 AS=1.47e-14 PD=4.2e-07 PS=4.9e-07 $X=1485 $Y=-1635 $D=1
M6 VDD S 1 VDD PMOS_HP L=5e-08 W=2.7e-07 AD=3.78e-14 AS=3.78e-14 PD=8.2e-07 PS=8.2e-07 $X=295 $Y=-525 $D=0
M7 6 1 VDD VDD PMOS_HP L=5e-08 W=2.7e-07 AD=8.91e-14 AS=3.78e-14 PD=1.2e-06 PS=8.2e-07 $X=485 $Y=-525 $D=0
M8 4 S 6 VDD PMOS_HP L=5e-08 W=2.7e-07 AD=3.78e-14 AS=8.91e-14 PD=8.2e-07 PS=1.2e-06 $X=865 $Y=-525 $D=0
M9 6 B 4 VDD PMOS_HP L=5e-08 W=2.7e-07 AD=3.78e-14 AS=3.78e-14 PD=8.2e-07 PS=8.2e-07 $X=1055 $Y=-525 $D=0
M10 VDD A 6 VDD PMOS_HP L=5e-08 W=2.7e-07 AD=5.07e-14 AS=3.78e-14 PD=9.2e-07 PS=8.2e-07 $X=1245 $Y=-525 $D=0
M11 Y 4 VDD VDD PMOS_HP L=5e-08 W=2.65e-07 AD=3.0475e-14 AS=5.07e-14 PD=7.6e-07 PS=9.2e-07 $X=1485 $Y=-520 $D=0
.ENDS
***************************************
