.option ACCURATE
.option measdgt=5
.OPTIONS GMINDC= 1e-18
.option probe post=2
.option INGOLD=1
.OPTIONS RELTOL=0.01
.inc "/usr/local2/ASAP7/afs/asu.edu/class/e/e/e/eee525b/asap7/asap7PDK/models/hspice/7nm_TT.pm"
.include "./nmos_lvt.sp"
.include "./nmos_rvt.sp"
.include "./nmos_slvt.sp"
.include "./nmos_sram.sp"
** default temperature **
.TEMP 25
** giving voltage values as variables**
.param Vgnd=0
.param Vvdd= 0.7
**all my devices instantiation **
X_my_nlvt d1 g1 s nlvt
X_my_nrvt d2 g2 s nrvt
X_my_nslvt d3 g3 s nslvt
X_my_nsram d4 g4 s nsram
** connecting voltAge sources to all pins with values defined in parmeters **
vS s 0 dc=Vgnd
vD1 d1 0 dc=Vvdd
vD2 d2 0 dc=Vvdd
vD3 d3 0 dc=Vvdd
vD4 d4 0 dc=Vvdd
Vgs1 g1 s dc=Vgnd
Vgs2 g2 s dc=Vgnd
Vgs3 g3 s dc=Vgnd
Vgs4 g4 s dc=Vgnd
**doing DC sweep **
.DC Vgs1 0 0.7 0.01
.DC Vgs2 0 0.7 0.01
.DC Vgs3 0 0.7 0.01
.DC Vgs4 0 0.7 0.01
**measuring current values**
.PROBE i(X_my_nlvt)
.PROBE i(X_my_nrvt)
.PROBE i(X_my_nslvt)
.PROBE i(X_my_nsram)
.PROBE i(*)
.PROBE v(*)
.option post
.end

