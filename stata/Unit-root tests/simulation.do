clear

set obs 100

* Generate a time variable
gen t = _n - 1
tsset t

* Generate three independent stadard normal variables
gen v1 = rnormal()
gen v2 = rnormal()
gen v3 = rnormal()

* Generate a Random-Walk process with v1 as error term
gen rw1 = 0
replace rw1 = 0.2 + L.rw1 + v1 in 2/l

* Generate a Random-Walk process with v2 as error term
gen rw2 = 0
replace rw2 = 0.2 + L.rw2 + v2 in 2/l

* Generate a Trend-Stationary process with v3 as error term
gen ts1 = 1 + 0.05*t + v3

tsline rw1 rw2 ts1

* An example of a spurious regression
reg rw1 rw2

* Unit root tests with drift for rw1 and rw2
dfuller rw1, regress lags(0)
dfuller rw2, regress lags(0)

* Unit root tests with no constant for D.rw1 and D.rw2
dfuller D.rw1, noconstant regress lags(0)
dfuller D.rw2, noconstant regress lags(0)

* Unit root test with trend for ts1
dfuller ts1, trend regress lags(0)
