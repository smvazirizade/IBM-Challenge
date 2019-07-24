# IBM-Challenge
This script has been generated for 2019 IBM Code Global Challenge.

# Model and Optimize Community Recovery Process: An Approximate Dynamic Approach

## General Description
Following the occurrence of a natural event, community recovery management should aim at providing optimal restoration policies for a community. Calculating such optimal restoration policies in the presence of uncertainty poses significant challenges for community leaders. The Markov decision process (MDP)-based optimization approach proposed in this study incorporates different sources of uncertainties to compute the restoration policies. The computation of optimal scheduling presented herein employs the rollout algorithm, which provides an effective computational tool for optimization problems. The proposed methodology is applied to a realistic community recovery problem, where different decision-making objectives are considered. The approach accommodates current restoration strategies employed in recovery management; computational results indicate that the restoration policies identified herein significantly outperform the current recovery strategies.
During the recovery process, the decision maker must select recovery actions sequentially to optimize the objectives of the community. The proposed framework possesses the following properties whereby supports policymakers at the community level:  
i.    The framework enables to balance the desire for low present cost with the undesirability of high future costs ( this is referred to as “non-myopic agent” or look-ahead property).  
ii.    It can consider different sources of uncertainties.  
iii.    It makes decisions periodically to not only take advantage of information that becomes available when recovery actions are in progress but also to adapt to disturbances during the recovery process. This is very important to absorb cascading hazards like strong aftershocks, postdisaster fires, etc.  
iv.    The methodology considers different types of dependencies and interdependencies among networks because a single decision can trigger cascading effects in multiple networks at the community level.  

v.   It can handle multi-objective tasks, which are common in real-world domains. The interconnectedness among networks and probable conflicts among competing objectives complicate the decision-making procedure.  

vi.    The framework considers different constraints, such as time constraints, limited budget and repair crew, and current regional entities’ policies.   

vii. The framework considers different risk behaviors of policymakers from risk-neutral to risk-averse.  

## Framework Steps
The steps of the proposed framework are as follows, 
[main.m](https://github.com/smvazirizade/IBM-Challenge/blob/master/Main%20Script/main.m):  
1- The topology of critical infrastructure systems is modeled (we modeled the Electrical Power Network of Gilory, CA, USA. 
[adj42.mat](https://github.com/smvazirizade/IBM-Challenge/blob/master/Main%20Script/Input/adj42.mat).  
2- The fragilities (related to the hazard) of each component are assigned. 
[initial.m](https://github.com/smvazirizade/IBM-Challenge/blob/master/Main%20Script/initial.m)  
3- The interdependencies between and within networks are modeled with the graph theory to capture the cascading effects following disasters and throughout recovery.  
4- Hazard and the distribution of intensities for each component are estimated.
[GilroyHazard.mat](https://github.com/smvazirizade/IBM-Challenge/blob/master/Main%20Script/Input/GilroyHazard.mat)  
5- The level of damage and functionality of each node is computed. 
[initial.m](https://github.com/smvazirizade/IBM-Challenge/blob/master/Main%20Script/initial.m)   
6- The downtime, the number of repair crews, and the repair budget are determined.   
7- Based on the proposed MDP framework, the state and action spaces is definded.   
8- The optimum repair action in each time slot is determined based on the proposed rollout algorithm as follows: 
### Rollout Steps 
8.1- Computing all possible actions in each time slot. 
[genarms.m](https://github.com/smvazirizade/IBM-Challenge/blob/master/Main%20Script/genarms.m)    
8.2- Simulating the available base policy and select the best one concerning the policymaker's preference. 
[genrewards.m](https://github.com/smvazirizade/IBM-Challenge/blob/master/Main%20Script/genrewards.m)  
8.3- Applying the best action in each time slot and repeats it until the end of recovery and reach to the rollout policy.  
It is mathematically guaranteed that rollout can improve the base policy.  
NOTE: The code in this folder runs under Windows and MacOS.  

The workflow implemented in this folder is:


Also, this folder includes a demo result, 
[ResultDemo.mat](https://github.com/smvazirizade/IBM-Challenge/tree/master/Main%20Script/Output). Furthermore, 
[PLOT_Demo.m](https://github.com/smvazirizade/IBM-Challenge/blob/master/Main%20Script/PLOT_Demo.m) shows the imporvevment in the community recovery process using the aforementioned data.

