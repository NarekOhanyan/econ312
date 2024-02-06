clear

set obs 200

gen t = _n
tsset t

* WN

gen e = rnormal()

tsline e, title("White Noise") name(wn, replace)

* MA(1)

gen x = 0
replace x = e + 0.5*L.e in 2/l

tsline x, title("MA(1)") name(ma1, replace)

* AR(1)

gen y = 0
replace y = 0.9*L.y + e in 2/l

tsline y, title("AR(1)") name(ar1, replace)

* AR(2)

gen w = 0
replace w = 1.5*L1.w - 0.7*L2.w + e in 3/l

tsline w, title("AR(2)") name(ar2, replace)

* ACF and PACF

ac y, title("ACF of AR(1)") name(ac, replace)

pac y, title("PACF of AR(1)") name(pac, replace)