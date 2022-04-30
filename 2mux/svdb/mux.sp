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
M6 VDD S 1 VDD PMOS_HP L=5e-08 W=2.15e-07 AD=3.01e-14 AS=3.01e-14 PD=7.1e-07 PS=7.1e-07 $X=295 $Y=-470 $D=0
M7 6 1 VDD VDD PMOS_HP L=5e-08 W=2.15e-07 AD=7.095e-14 AS=3.01e-14 PD=1.09e-06 PS=7.1e-07 $X=485 $Y=-470 $D=0
M8 4 S 6 VDD PMOS_HP L=5e-08 W=2.15e-07 AD=3.01e-14 AS=7.095e-14 PD=7.1e-07 PS=1.09e-06 $X=865 $Y=-470 $D=0
M9 6 B 4 VDD PMOS_HP L=5e-08 W=2.15e-07 AD=3.01e-14 AS=3.01e-14 PD=7.1e-07 PS=7.1e-07 $X=1055 $Y=-470 $D=0
M10 VDD A 6 VDD PMOS_HP L=5e-08 W=2.15e-07 AD=2.585e-14 AS=3.01e-14 PD=8.1e-07 PS=7.1e-07 $X=1245 $Y=-470 $D=0
M11 Y 4 VDD VDD PMOS_HP L=5e-08 W=9e-08 AD=1.035e-14 AS=2.585e-14 PD=4.1e-07 PS=8.1e-07 $X=1485 $Y=-345 $D=0
.ENDS
***************************************