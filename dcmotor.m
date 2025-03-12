motorConstant = 0.01;
inductance = 0.5;
resistance = 1;
inertia = 0.01;
friction = 0.1;

s = tf('s');
motorTransferFunc = motorConstant / ((inductance * s + resistance) * (inertia * s + friction) + motorConstant^2);

P_gain = 12;
I_gain = 6;
D_gain = 3;

pidController = pid(P_gain, I_gain, D_gain);

closedLoopSystem = feedback(pidController * motorTransferFunc, 1);

figure;
step(closedLoopSystem);
title('DC Motor Hız Kontrolü - PID Yanıtı');
xlabel('Zaman (s)');
ylabel('Hız (rad/s)');

