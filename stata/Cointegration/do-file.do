clear
set more off

cd "C:\Users\AUA121\Downloads"

use gfc.dta, clear

gen date = tq(1994q1)+_n-1
tsset date, quarterly

tsline leuro lusa

* cointegrating relationship without a trend
reg leuro lusa
predict ehat1, residuals

tsline ehat1

dfuller ehat1, noconstant regress lags(2)

* cointegrating relationship with a trend
reg leuro lusa date
predict ehat2, residuals

tsline ehat2

dfuller ehat2, noconstant regress lags(2)

* ARDL in differences
reg D.leuro L.D.leuro D.lusa L.D.lusa

* ECM
reg D.leuro L.ehat1 D.L(0/1).lusa
