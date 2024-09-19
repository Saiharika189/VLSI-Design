.option ACCURATE
.option measdgt=5
.OPTIONS GMINDC= 1e-18
.option probe post=2
.option INGOLD=1
.OPTIONS RELTOL=0.01

.inc "/usr/local2/ASAP7/afs/asu.edu/class/e/e/e/eee525b/asap7/asap7PDK/models/hspice/7nm_TT.pm"

.include "./pmos_rvt.sp"
.TEMP 25


.param Vgnd=0
.param Vvdd= 0.7
X_my_prvt d g s prvt

vS s 0 dc=Vvdd
Vds d s dc=Vgnd
Vsg s g dc=Vvdd
.DC Vds -0.7 0 0.01 TEMP POI 3 -40 25 120
.PROBE i(X_my_prvt)
.PROBE i(*)
.PROBE v(*)
.option post
.end

