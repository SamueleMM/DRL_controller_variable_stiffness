%% Model parameters
clc
%setup_rotflex()
param = Params(0.65);
A = param{1,1};
B = param{1,2};
C = param{1,3};
D = param{1,4};
param = load('param13.mat').x;
K = param{1,5};

%% Reinforcement Learning (RL) parameters
Ts = 0.025; % Agent sample time
Tf = 5;    % Simulation end time

theta_f = pi/2;

% Scaling factor for RL action [-1 1]
max_Voltage = 10;

% Initial conditions
theta = 0;     % motor angle
alpha  = 0;      % link angle
%% stop learning criteria 
% criteiaLevel = 0.25;
% out = load('out.mat').out;
% stopCriteria = @stopCondition;

%% Open the Simulink model.
mdl = 'SS_Model';
open_system(mdl)


%% Create Environment Interface
% Create the observation specification.
numObs = 6;
obsInfo = rlNumericSpec([numObs 1]);
obsInfo.Name = 'observations';
% Create the action specification.
numAct = 1;
actInfo = rlNumericSpec([numAct 1],'LowerLimit',-1,'UpperLimit',1);
actInfo.Name = 'Input_voltage';
% Create the environment interface for the flexible joint.
blk = [mdl,'/RL Agent'];
env = rlSimulinkEnv(mdl,blk,obsInfo,actInfo);
% reset env
theta = 0;
alpha = 0;

pretrain = false;

if pretrain
    % reload the pretrained agent and train it
    agent = load('pretrained_agent.mat').agent;
else
    %% Select and Create Agent for Training
    % train the robot either using either a DDPG or TD3 agent.
    AgentSelection = 'DDPG';
    switch AgentSelection
        case 'DDPG'
            agent = createDDPGAgent(numObs,obsInfo,numAct,actInfo,Ts);
        case 'TD3'
            agent = createTD3Agent(numObs,obsInfo,numAct,actInfo,Ts);
        otherwise
            disp('Enter DDPG or TD3 for AgentSelection')
    end
end
%% Specify Training Options and Train Agent
maxEpisodes = 30000;
maxSteps = floor(Tf/Ts);
trainOpts = rlTrainingOptions(...
    'MaxEpisodes',maxEpisodes,...
    'MaxStepsPerEpisode',maxSteps,...
    'ScoreAveragingWindowLength',100,...
    'Verbose',false,...
    'Plots','training-progress',...
    'StopTrainingCriteria','EpisodeReward',...
    'StopTrainingValue',1350,...
    'SaveAgentCriteria','EpisodeCount',...
    'SaveAgentValue',maxEpisodes);

% 
% trainOpts.UseParallel = true;
% trainOpts.ParallelizationOptions.Mode = 'async';
% trainOpts.ParallelizationOptions.StepsUntilDataIsSent = 32;
% trainOpts.ParallelizationOptions.DataToSendFromWorkers = 'Experiences';

% training 
doTraining = true;
if doTraining    
    % Train the agent.
    trainingStats = train(agent,env,trainOpts);

else
    % Load pretrained agent for the selected agent.
    if strcmp(AgentSelection,'DDPG')
       load('myagent.mat','agent')
    else
       load('myagent.mat','agent')
    end  
end

