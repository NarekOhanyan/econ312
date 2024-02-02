var y;
varexo e;

parameters c phi;
c = 1;
phi = 0.9;

model(linear);
y = c + phi*y(-1) + e;
end;

shocks;
var e = 0.01;
end;

stoch_simul(irf=24) y;