* File: MUX2_X1_xRC.sp
* Created: Fri Apr 15 13:11:33 2022
* Program "Calibre xRC"
* Version "v2020.3_24.16"
* 
.include "MUX2_X1_xRC.sp.pex"
.subckt MUX2_X1  S A B VDD VSS Y
* 
* Y	Y
* VSS	VSS
* VDD	VDD
* B	B
* A	A
* S	S
mn1 N_NS_BAR_mn1_d N_S_mn1_g N_VSS_mn1_s N_VSS_mn1_b NMOS_HP L=1.4e-07 W=2.3e-07
+ AD=5.52e-14 AS=7.13e-14 PD=9.4e-07 PS=1.08e-06
mn2 noxref_10 N_NS_BAR_mn2_g N_VSS_mn1_s N_VSS_mn1_b NMOS_HP L=1.4e-07 W=2.3e-07
+ AD=3.335e-14 AS=7.13e-14 PD=7.5e-07 PS=1.08e-06
mn3 N_NY_BAR_mn3_d N_A_mn3_g noxref_10 N_VSS_mn1_b NMOS_HP L=1.4e-07 W=2.3e-07
+ AD=7.475e-14 AS=3.335e-14 PD=1.11e-06 PS=7.5e-07
mn5 N_NY_BAR_mn3_d N_S_mn5_g noxref_11 N_VSS_mn1_b NMOS_HP L=1.4e-07 W=2.3e-07
+ AD=7.475e-14 AS=3.45e-14 PD=1.11e-06 PS=7.6e-07
mn4 noxref_11 N_B_mn4_g N_VSS_mn4_s N_VSS_mn1_b NMOS_HP L=1.4e-07 W=2.3e-07
+ AD=3.45e-14 AS=4.715e-14 PD=7.6e-07 PS=8.7e-07
mn6 N_Y_mn6_d N_NY_BAR_mn6_g N_VSS_mn4_s N_VSS_mn1_b NMOS_HP L=1.4e-07 W=2.3e-07
+ AD=4.83e-14 AS=5.75e-14 PD=8.8e-07 PS=9.6e-07
mp1 N_NS_BAR_mp1_d N_S_mp1_g N_VDD_mp1_s N_VDD_mp1_b PMOS_HP L=1.4e-07
+ W=4.05e-07 AD=9.72e-14 AS=1.2555e-13 PD=1.29e-06 PS=1.43e-06
mp2 N_noxref_6_mp2_d N_NS_BAR_mp2_g N_VDD_mp1_s N_VDD_mp1_b PMOS_HP L=1.4e-07
+ W=4.05e-07 AD=1.39725e-13 AS=1.2555e-13 PD=1.5e-06 PS=1.43e-06
mp3 N_NY_BAR_mp3_d N_S_mp3_g N_noxref_6_mp2_d N_VDD_mp1_b PMOS_HP L=1.4e-07
+ W=4.05e-07 AD=9.5175e-14 AS=1.39725e-13 PD=1.28e-06 PS=1.5e-06
mp5 N_NY_BAR_mp3_d N_B_mp5_g N_noxref_6_mp5_s N_VDD_mp1_b PMOS_HP L=1.4e-07
+ W=4.05e-07 AD=9.5175e-14 AS=1.3365e-13 PD=1.28e-06 PS=1.47e-06
mp4 N_noxref_6_mp5_s N_A_mp4_g N_VDD_mp4_s N_VDD_mp1_b PMOS_HP L=1.4e-07
+ W=4.05e-07 AD=1.3365e-13 AS=1.08725e-13 PD=1.47e-06 PS=1.5e-06
mp6 N_Y_mp6_d N_NY_BAR_mp6_g N_VDD_mp4_s N_VDD_mp1_b PMOS_HP L=1.4e-07 W=2.5e-07
+ AD=6.625e-14 AS=1.08725e-13 PD=1.03e-06 PS=1.5e-06
*
.include "MUX2_X1_xRC.sp.MUX2_X1.pxi"
*
.ends
*
*
