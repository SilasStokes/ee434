* File: mux_xRC.sp
* Created: Fri Apr 29 23:38:35 2022
* Program "Calibre xRC"
* Version "v2020.3_24.16"
* 
.include "mux_xRC.sp.pex"
.subckt mux  S A B VDD VSS Y
* 
* Y	Y
* VSS	VSS
* VDD	VDD
* B	B
* A	A
* S	S
mn1 N_NS_BAR_mn1_d N_S_mn1_g N_VSS_mn1_s N_VSS_mn1_b NMOS_HP L=5e-08 W=1.05e-07
+ AD=1.6275e-14 AS=1.47e-14 PD=5.2e-07 PS=4.9e-07
mn2 noxref_10 N_NS_BAR_mn2_g N_VSS_mn1_s N_VSS_mn1_b NMOS_HP L=5e-08 W=1.05e-07
+ AD=1.47e-14 AS=1.47e-14 PD=4.9e-07 PS=4.9e-07
mn3 N_NY_BAR_mn3_d N_A_mn3_g noxref_10 N_VSS_mn1_b NMOS_HP L=5e-08 W=1.05e-07
+ AD=1.47e-14 AS=1.47e-14 PD=4.9e-07 PS=4.9e-07
mn5 N_NY_BAR_mn3_d N_S_mn5_g noxref_11 N_VSS_mn1_b NMOS_HP L=5e-08 W=1.05e-07
+ AD=1.47e-14 AS=1.47e-14 PD=4.9e-07 PS=4.9e-07
mn4 noxref_11 N_B_mn4_g N_VSS_mn4_s N_VSS_mn1_b NMOS_HP L=5e-08 W=1.05e-07
+ AD=1.47e-14 AS=1.26e-14 PD=4.9e-07 PS=4.5e-07
mn6 N_Y_mn6_d N_NY_BAR_mn6_g N_VSS_mn4_s N_VSS_mn1_b NMOS_HP L=5e-08 W=1.05e-07
+ AD=1.1025e-14 AS=1.47e-14 PD=4.2e-07 PS=4.9e-07
mp1 N_NS_BAR_mp1_d N_S_mp1_g N_VDD_mp1_s N_VDD_mp1_b PMOS_HP L=5e-08 W=2.7e-07
+ AD=3.78e-14 AS=3.78e-14 PD=8.2e-07 PS=8.2e-07
mp2 N_noxref_6_mp2_d N_NS_BAR_mp2_g N_VDD_mp1_s N_VDD_mp1_b PMOS_HP L=5e-08
+ W=2.7e-07 AD=8.91e-14 AS=3.78e-14 PD=1.2e-06 PS=8.2e-07
mp3 N_NY_BAR_mp3_d N_S_mp3_g N_noxref_6_mp2_d N_VDD_mp1_b PMOS_HP L=5e-08
+ W=2.7e-07 AD=3.78e-14 AS=8.91e-14 PD=8.2e-07 PS=1.2e-06
mp5 N_NY_BAR_mp3_d N_B_mp5_g N_noxref_6_mp5_s N_VDD_mp1_b PMOS_HP L=5e-08
+ W=2.7e-07 AD=3.78e-14 AS=3.78e-14 PD=8.2e-07 PS=8.2e-07
mp4 N_noxref_6_mp5_s N_A_mp4_g N_VDD_mp4_s N_VDD_mp1_b PMOS_HP L=5e-08 W=2.7e-07
+ AD=3.78e-14 AS=2.97e-14 PD=8.2e-07 PS=9.2e-07
mp6 N_Y_mp6_d N_NY_BAR_mp6_g N_VDD_mp4_s N_VDD_mp1_b PMOS_HP L=5e-08 W=9e-08
+ AD=1.035e-14 AS=2.97e-14 PD=4.1e-07 PS=9.2e-07
*
.include "mux_xRC.sp.MUX.pxi"
*
.ends
*
*
