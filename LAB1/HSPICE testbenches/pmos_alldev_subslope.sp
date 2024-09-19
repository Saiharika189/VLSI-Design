.option ACCURATE
.option measdgt=5
.OPTIONS GMINDC= 1e-18
.option probe post=2
.option INGOLD=1
.OPTIONS RELTOL=0.01

.inc "/usr/local2/ASAP7/afs/asu.edu/class/e/e/e/eee525b/asap7/asap7PDK/models/hspice/7nm_TT.pm"

.include "./pmos_lvt.sp"
.include "./pmos_rvt.sp"
.include "./pmos_slvt.sp"
.include "./pmos_sram.sp"
** default temperature **
.TEMP -40

** giving voltage values as variables**
.param Vgnd=0
.param Vvdd= 0.7
X_my_plvt d g1 s1 plvt
X_my_prvt d g1 s2 prvt
X_my_pslvt d g1 s3 pslvt
X_my_psram d g1 s4 psram

** connecting volatge sources to all pins with values defined in parmeters **
vS1 s1 0 dc=Vvdd
vS2 s2 0 dc=Vvdd
vS3 s3 0 dc=Vvdd
vS4 s4 0 dc=Vvdd
vD d 0 dc=Vgnd

Vgs1 g1 s1 dc=Vgnd
*Vgs2 g2 s2 dc=Vgnd
*Vgs3 g3 s3 dc=Vgnd
*Vgs4 g4 s4 dc=Vgnd

.DC Vgs1 -0.7 0 0.01
*.DC Vgs2 -0.7 0 0.01
*.DC Vgs3 -0.7 0 0.01
*.DC Vgs4 -0.7 0 0.01

.PROBE LVT = deriv("log10(i(X_my_plvt.MM0))")
.meas swingLVT min "1000/abs(par(LVT))"

.PROBE SLVT = deriv("log10(i(X_my_pslvt.MM0))")
.meas swingSLVT min "1000/abs(par(SLVT))"

.PROBE RVT = deriv("log10(i(X_my_prvt.MM0))")
.meas swingRVT min "1000/abs(par(RVT))"

.PROBE SRAM = deriv("log10(i(X_my_psram.MM0))")
.meas swingSRAM min "1000/abs(par(SRAM))"



.PROBE i(X_my_plvt)
.PROBE i(X_my_prvt)
.PROBE i(X_my_pslvt)
.PROBE i(X_my_psram)
.PROBE i(*)
.PROBE v(*)
.option post
.end

