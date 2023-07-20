# DRL_controller_variable_stiffness
Reinforcement Learning Stiffness Control of 4D-printed Soft Joint Robotic Arm


Required software: 
Matlab R2022a or later versions
Reinforcement Learning Toolbox - MATLAB

To run the app, you need to run DRL_parameter.m
in this script, some flags have to be valued 

1- "pretraind": if you have a pre-trained DRL model, this model can be valued as "true", and rename the model name to your pre-trained model.
    Otherwise, it can be "false" to build and train a new model.
    
2- "AgentSelection": type of the model should be valued: a) DDPG or b) TD3

3- "doTraining": If you want to retrain your pre-trained model or train the new model, the flag "doTraining" must be "true."
    otherwise, if you want to load the agent to the simulation variable, set it as "false."
    
4- The training hyperparameter must be appropriately set when training a new model.
_________________________________________________________

If you want to compare your pre-trained model with the PID controller, run the DRL_parameter.m to reload your model.

Then run the "compare.m" script to compare two controllers.


_____________________________________________________________
***NOTICE***: To value the system parameters and deduct the state space model, the Quanser function where used that we are not allowed to upload here.
You'll need to set the system parameters before you run the models.



### Paper: ***Reinforcement Learning Stiffness Control of 4D-printed Soft Joint Robotic Arm***
