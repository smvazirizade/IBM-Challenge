# IBM-Challenge
This script has been generated 2019 IBM Code Global Challenge.

# Model and Optimize Community Recovery Process: An Approximate Dynamic Approach

## General Description
Following the occurrence of a natural event, community recovery management should aim at providing optimal restoration policies for a community. Calculating such optimal restoration policies in the presence of uncertainty poses significant challenges for community leaders. The Markov decision process (MDP)-based optimization approach proposed in this study incorporates different sources of uncertainties to compute the restoration policies. The computation of optimal scheduling presented herein employs the rollout algorithm, which provides an effective computational tool for optimization problems. The proposed methodology is applied to a realistic community recovery problem, where different decision-making objectives are considered. The approach accommodates current restoration strategies employed in recovery management; computational results indicate that the restoration policies identified herein significantly outperform the current recovery strategies.
During the recovery process, the decision maker must select recovery actions sequentially to optimize the objectives of the community. The proposed framework possesses the following properties whereby supports policymakers at the community level:  
i.    The framework enables to balance the desire for low present cost with the undesirability of high future costs ( this is referred to as “non-myopic agent” or look-ahead property).  
ii.    It can consider different sources of uncertainties.  
iii.    It makes decisions periodically to not only take advantage of information that becomes available when recovery actions are in progress but also to adapt to disturbances during the recovery process. This is very important to absorb cascading hazards like strong aftershocks, postdisaster fires, etc.  
v.    The methodology considers different types of dependencies and interdependencies among networks because a single decision can trigger cascading effects in multiple networks at the community level.  

vi.   It can handle multi-objective tasks, which are common in real-world domains. The interconnectedness among networks and probable conflicts among competing objectives complicate the decision-making procedure.  

vii.    The framework considers different constraints, such as time constraints, limited budget and repair crew, and current regional entities’ policies.   

viii. The framework considers different risk behaviors of policymakers from risk-neutral to risk-averse.  

## Framework Steps
The steps of the proposed framework are as follows (find in the main.m file):  
1- The topology of critical infrastructure systems is modeled (we modeled the Electrical Power Network of Gilory, CA, USA,find in the adj42.m file).  
2- The fragilities (related to the hazard) of each component are assigned (find in the initial.m file).  
3- The interdependencies between and within networks are modeled with the graph theory to capture the cascading effects following disasters and throughout recovery.  
4- Simulate the hazard and find the distribution of intensities for each component (find in the GilroyHazard.m file).  
5- Compute the level of damage and functionality of each node (find in the initial.m file).  
6- Determine the downtime, the number of repair crews, and the repair budget.  
7- Based on the proposed MDP framework define the state and action spaces.  
8- Determine the optimum repair action in each time slot based on the proposed rollout algorithm as follows; 
### Rollout Steps 
8.1- Compute all possible actions in each time slot (find in the genarms.m file).  
8.2- Simulate the available base policy and select the best one concerning the policymaker's preference (find in the genrewards.m file). 
8.3- Apply the best action in each time slot and repeats it until the end of recovery and reach to the rollout policy.  
It is mathematically guaranteed that rollout can improve the base policy.  
NOTE: The code in this folder runs under Windows and MacOS.  

The workflow implemented in this folder is:


Also, this folder includes an example, ----.m, which run an example with the following information:

