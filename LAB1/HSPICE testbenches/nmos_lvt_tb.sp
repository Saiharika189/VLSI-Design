.option ACCURATE
.option measdgt=5
.OPTIONS GMINDC= 1e-18
.option probe post=2
.option INGOLD=1
.OPTIONS RELTOL=.01

.inc "/usr/local2/ASAP7/afs/asu.edu/class/e/e/e/eee525b/asap7/asap7PDK/models/hspice/7nm_TT.pm"

.include "./nmos_lvt.sp"
.TEMP 25
.option

.param Vgnd=0
.param Vvdd= 0.7
X_my_nlvt d g s nlvt

vS s 0 dc=Vgnd
vD d 0 dc=Vvdd
Vg g 0 dc=0
.DC Vg 0 0.7 0.01 TEMP POI 3 -40 25 120
.PROBE i(X_my_nlvt)
.PROBE i(*)
.PROBE v(*)
.option post
.end

