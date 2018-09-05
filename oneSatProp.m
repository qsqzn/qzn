function oneSatProp( satName, t_start, t_stop, dt)


st = sprintf('Scenario/AllSats/Satellite/%s', satName);
[T, r, v, cb] = stkEphemerisCBI(st ,dt, t_start, t_stop);

% T_MB
% r_MB
% v_MB
% cb

pos = r(:, 1);%size(r_MB, 2));
vel = v(:, 1);%size(v_MB, 2));

orbitEpoch = t_start;

st = sprintf('*/Satellite/%s', satName);
stkSetPropCart(st,'TwoBody','J2000',t_start, t_stop, dt, orbitEpoch, pos, vel);



