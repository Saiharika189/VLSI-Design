************************************************************************
* auCdl Netlist:
* 
* Library Name:  lab1
* Top Cell Name: nslvt
* View Name:     schematic
* Netlisted on:  Sep  6 01:10:55 2024
************************************************************************

*.BIPOLAR
*.RESI = 2000 
*.RESVAL
*.CAPVAL
*.DIOPERI
*.DIOAREA
*.EQUATION
*.SCALE METER
*.MEGA
.PARAM



************************************************************************
* Library Name: lab1
* Cell Name:    nslvt
* View Name:    schematic
************************************************************************

.SUBCKT nslvt d g s
*.PININFO d:I g:I s:I
MM0 d g s s nmos_slvt w=378.00n l=20n nfin=14
.ENDS

