# DRL_controller_variable_stiffness
Reinforcement Learning Stiffness Control of 4D-printed Soft Joint Robotic Arm


Required software: 
Matlab R2022a or later versions
Reinforcement Learning Toolbox - MATLAB

To run the app, you need to run DRL_parameter.m
in this script, some flags have to be valued 
1- pretraind: if you have a pretraind DRL model, this model can be valued as "True" and rename the model name to your pretraind model.
    otherwise it can be "False" to build and train a new model.
2- type of the model should be valued: a) DDPG or b)TD3
