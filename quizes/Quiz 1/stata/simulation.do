clear

set obs 2000

gen t = _n
tsset t

* WN

gen e = rnormal()

* AR(3)

gen y = 0
replace y = 1.1*L1.y - 0.8*L2.y + 0.5*L3.y + e in 4/l

tsline y, title("AR(3)") name(ar1, replace)

* ACF and PACF

ac y, title("ACF") name(ac, replace)
graph export "./fig/acf.pdf", as(pdf) replace

pac y, title("PACF") name(pac, replace)
graph export "./fig/pacf.pdf", replace
