.option ACCURATE
.option measdgt=5
.OPTIONS GMINDC= 1e-18
.option probe post=2
.option INGOLD=1
.OPTIONS RELTOL=.01

.inc "/usr/local2/ASAP7/afs/asu.edu/class/e/e/e/eee525b/asap7/asap7PDK/models/hspice/7nm_TT.pm"

.include "./pmos_rvt.sp"
.TEMP 25
.option

.param Vgnd=0
.param Vvdd= 0.7
X_my_prvt_1 d g1 s prvt
X_my_prvt_2 d g2 s prvt

vS s 0 dc=Vvdd
Vds d s dc=Vgnd
Vsg1 s g1 dc=0.7
Vsg2 s g2 dc=0.35

.DC Vds -0.7 0 0.01 

.measure DC Ih find i(X_my_prvt_1.MM0) when v(d) = "0.35"
.measure DC Il find i(X_my_prvt_2.MM0) when v(d) = "0"
.measure Ieff param = "0.5*(Il+Ih)"

*.DC vD2 0 0.7 0.01 
*.measure DC Il find i(X_my_nrvt.MM0) when v(g) = "0.35"
*.measure DC Ih find i(X_my_nrvt.MM0) when v(g) = "0.7"

.PROBE i(*)
.PROBE v(*)
.option post
.end
