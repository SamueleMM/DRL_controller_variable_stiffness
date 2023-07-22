# DRL_controller_variable_stiffness
## Reinforcement Learning for Flexible Joint Control
Reinforcement Learning Stiffness Control of 4D-printed Soft Joint Robotic Arm


Required software: 
Matlab R2022a or later versions
Reinforcement Learning Toolbox - MATLAB



This MATLAB program demonstrates how to apply reinforcement learning (RL) to control a flexible joint system. The goal is to train an RL agent to control the joint's behavior and achieve a desired angle while maximizing the cumulative reward.

To run the app, you need to run DRL_parameter.m
in this script, some flags have to be valued 

## Model Parameters

Before running the program, you need to specify the following model parameters:

- `param`: A cell array containing numerical values for A, B, C, D, and K, which are used in the flexible joint model.

***NOTICE***: To value the system parameters and deduct the state space model, the Quanser function where used that we are not allowed to upload here.
You'll need to set the system parameters before you run the models.

- `Ts`: The agent sample time, defining how often the agent takes actions.
- `Tf`: The simulation end time, indicating the duration of the RL training.
- `theta_f`: The desired final motor angle that the agent aims to achieve during training.
- `max_Voltage`: The scaling factor for the RL action, setting the upper and lower limits of the input voltage.
- `theta`: The initial motor angle.
- `alpha`: The initial link angle.

## Reinforcement Learning (RL) Parameters

The RL training process involves the following parameters:

- `numObs`: The number of observations, representing the state space of the environment. In this program, it is set to 6.
- `obsInfo`: A specification of the observation space.
- `numAct`: The number of actions available to the RL agent. Here, it is set to 1.
- `actInfo`: A specification of the action space.
- `AgentSelection`: The type of RL agent used for training, either 'DDPG' (Deep Deterministic Policy Gradients) or 'TD3' (Twin Delayed Deep Deterministic Policy Gradients).

## Pretraining Option

If `pretrain` is set to true, the program will reload a pretrained agent named "pretrained_agent.mat" and continue its training. If set to false, the program will create and train a new RL agent.

## Training Options and Training the Agent

The program uses a custom function to create either a DDPG or TD3 agent based on the selected `AgentSelection`. Once the agent is created, the training process starts with the specified options:

- `maxEpisodes`: The maximum number of episodes for the RL agent to learn.
- `maxSteps`: The maximum number of steps per episode.
- `ScoreAveragingWindowLength`: The window length for averaging the episode scores in the training progress plot.
- `Verbose`: If set to true, training progress will be displayed in the console.
- `Plots`: Specify whether to show training-progress plots.
- `StopTrainingCriteria`: The criterion for stopping the training process. Here, it is set to 'EpisodeReward'.
- `StopTrainingValue`: The reward threshold that, once achieved, will trigger the end of the training process.
- `SaveAgentCriteria`: The criterion for saving the trained agent. In this case, it is 'EpisodeCount'.
- `SaveAgentValue`: The episode count at which the agent will be saved.

## Usage

1. Set the appropriate values for the model parameters mentioned above.
2. If you want to use a pretrained agent, ensure that `pretrain` is set to true, and the "pretrained_agent.mat" file is available in the working directory.
3. Select the desired RL agent by setting the `AgentSelection` variable to either 'DDPG' or 'TD3'.
4. Specify the training options to customize the training process as needed.
5. "doTraining": If you want to retrain your pre-trained model or train the new model, the flag "doTraining" must be "true."
    otherwise, if you want to load the agent to the simulation variable, set it as "false."
6. Run the program in MATLAB to start the RL training process.

Feel free to modify the model parameters and RL training options to suit your specific requirements. Happy training!

---

If you want to compare your pre-trained model with the PID controller, run the DRL_parameter.m to reload your model.
Then run the "compare.m" script to compare two controllers.

---
*Note: Please make sure to provide proper citations and credits if you use this code or part of it in your work. Always test the code thoroughly and validate its performance before using it in critical applications.*


### Paper: ***Reinforcement Learning Stiffness Control of 4D-printed Soft Joint Robotic Arm***

PS: this readme file is written with the help of AI generative models (ChatGPT).
