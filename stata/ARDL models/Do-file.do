clear
set more off

cd "C:\Users\Narek\Downloads\"

use "phillips_aus.dta", clear

* set the time variable
generate date = tq(1987q1) + _n-1
tsset date, quarterly

* time-series graphs
tsline inf, name(Inf, replace)
tsline u, name(U, replace)
tsline D.u, name(dU, replace)

* correlograms
ac inf
ac D.u

* Phillips curve with OLS standard errors
reg inf D.u

* Phillips curve with HAC standard errors
newey inf D.u, lag(4)

* ARDL model for Phillips curve
reg inf L.inf D.u L.D.u
predict e,res
ac e