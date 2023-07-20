cf =1000;
out = sim('DRL_Model_PID_Modelp',10);
%% get data
alpha  = squeeze(out.simout.alpha.Data(1,1,:));
alphaP = out.simout.alphaP.Data;
theta  = squeeze(out.simout.theta.Data(1,1,:));
thetaP = out.simout.thetaP.Data;
Vol_ag = squeeze(out.simout.Vol_ag.Data(1,1,:));
Vol_P  = out.simout.Vol_P.Data;
ref = out.simout.refrence.Data;
time   = out.tout;

%% sin camparisopn 

c1 = sum(abs(alpha))*10/length(alpha);
c2 = sum(abs(alphaP))*10/length(alphaP);

c3 = sum(Vol_ag.^2)*10/length(Vol_ag);
c4 = sum(Vol_P.^2)*10/length(Vol_P);

c5 = sum(abs(theta-ref))*10/length(Vol_ag);
c6 = sum(abs(thetaP-ref))*10/length(Vol_P);
clc
disp('Alpha_agnt , Alpha_PID, Vol_agnt, Vol_PID, trackDiff_agnt, trackDiff_PID')
disp([c1,c2,c3,c4,c5,c6])

%% step camparisopn 

sia = stepinfo(theta(1:500),time(1:500));
sip = stepinfo(thetaP(1:500),time(1:500));
disp('riseTime_agnt(s),risetime_PID(s), Settle_agnt(s) , Settle_PID(s), overshoot_agnt%,overshoot_PID%')
disp([sia.RiseTime, sip.RiseTime, sia.SettlingTime , sip.SettlingTime , sia.Overshoot , sip.Overshoot ])

%% rewards 
disp('rewardAgent,  rewardPID')
disp([sum(out.simout.reward_ag.Data)*Ts,sum(out.simout.reward_P.Data)*Ts])