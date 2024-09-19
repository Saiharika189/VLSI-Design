************************************************************************
* auCdl Netlist:
* 
* Library Name:  lab1
* Top Cell Name: plvt
* View Name:     schematic
* Netlisted on:  Sep  6 01:32:59 2024
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
* Cell Name:    plvt
* View Name:    schematic
************************************************************************

.SUBCKT plvt d g s
*.PININFO d:I g:I s:I
MM0 d g s s pmos_lvt w=378.00n l=20n nfin=14
.ENDS

