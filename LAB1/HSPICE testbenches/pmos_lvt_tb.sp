.option ACCURATE
.option measdgt=5
.OPTIONS GMINDC= 1e-18
.option probe post=2
.option INGOLD=1
.OPTIONS RELTOL=0.01

.inc "/usr/local2/ASAP7/afs/asu.edu/class/e/e/e/eee525b/asap7/asap7PDK/models/hspice/7nm_TT.pm"

.include "./pmos_lvt.sp"
.TEMP 25


.param Vgnd=0
.param Vvdd= 0.7

X_my_plvt d g s plvt

vS s 0 dc=Vvdd
vD d 0 dc=Vgnd
Vgs g s dc=0

.DC Vgs -0.7 0 0.01 TEMP POI 3 -40 25 120

.PROBE i(X_my_plvt)
.PROBE i(*)
.PROBE v(*)
.option post
.end

