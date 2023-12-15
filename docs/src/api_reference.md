## `compute_cost(x, parameters)`
```@docs
```
This function compute the cost of the actual state using the
current action $a_t$. The cost is the sum of the conributions regaring
to the burden of a diseases quantifyed in DALYs and the implicated cost,
related with the vaccination campaing.

According to the definition of DALY we compute this indicator with
```math
    \begin{aligned}
        DALY 
            &:= 
                YLL + YLD
        \\
        YLL(t_{k + 1}) 
            &:=
                \int_{t_k}^{t_{k + 1}}
                    m_1  (D(t) - D(t_k))
                dt
        \\
        YLD(t_{k + 1})
            &:= 
                \int_{t_k}^{t_{k + 1}}
                    m_2 (I_S(t) - I_S(t_k))
                dt.
        \\
    \end{aligned}
```
Then we estimate the cost due to the vaccine stock management and
deploy of the underlying vaccination campaing by

```math
    \begin{aligned}
        C_{stock} (t_{k + 1})
            &:=
                \int_{t_k}^{t_{k + 1}}
                    C(K_t)
                dt
        \\
        C_{campaing}(t_{k + 1})
            &:=
                \int_{t_k}^{t_{k + 1}}
                    m_4 (X_{vac}(t) - X_{vac}(t_{k}))
    \end{aligned}
```
## `get_interval_solution!(time_interval, x, opt_policy, a_t, k,parameters)`
```@docs
```
From a point of solution of SEIRVD model $x,$ a stock level $k,$ and the most recent parameters, this function evaluates the SEIRVD solution for possible vaccine control $opt_policy$ in each sequence of time point of  $time_ interval,$

# `get_path_plot(df_solution)`
```@docs
```
From the solution stored in data frame $df_solution$, this function returns the graph evolution of counter of each compartment in the  SEIRVD and the vaccine stock level evolution.
# `get_solution_path!(parameters)`
```@docs
```
 From of the parameters, this function returns the initial values and the solution of $SEIRVDX_{vac} model.

# `get_stencil_projection(t, parameters)`
```@docs
```
This function is implemented by computing

```math
\begin{aligned}
    \eta(t): = \sup
        \{
            i: t_i \leq t
    \}, \quad i \in \{1,2 , \dots, M \}
\end{aligned}
```
where the index $i$ runs over the projected 
delivery times $t_i$.

# `get_stochastic_perturbation(son_file_name)`
For the arrive of inventory vaccine order return a new delivery time  and the new size of this order. The new delivery time is simulated under the hipothesis that the time betwen orders follows a normal distribution with mean this time increment and standard deviation the root of the same time increment. The new size of vaccine order is simulated under the hipothesis that the size order follows a truncated normal distribution with mean the size order $K_p$ that was previously programed and the standard deviation is the half of the root of this size programed order. The truncated normal is considered with support $[0,2K_p].$    

## `get_vaccine_action!(X_C,t,parameters)`
Calculates at time $t,$ the possible percentage of vaccine coverage population when the current inventory level of vaccines is $X_C$  according to size of time horizon.  
## `get_vaccine_stock_coverage(k, parameters)`
Returns el percentage of popullation to vaccine when the inventory level of interest is $k$ and use the current parameters 

## `load_parameters(json_file_name)`

The function acces of the archive $json_file_name$ all initial parameters of SERIVDX_{vac}$ inventory model. 

## `rhs_evaluation!(t, x, opt_policy,  a_t, k, parameters)`

The function evaluates the solution of SERIVDX_{vac}$ inventory model at time $t+1$ when the solution in the time $t$ is $x,$ is used the value $opt_policy$ as policy, the avaliable inventory level is $k$ and the percentage to vaccine population is $a_t$ when $parameters$ are the current parameters.

## `save_interval_solution(x,header_strs,file_name)`

The function save the array solution $x$ in a data frame with the $header_strs$ as headers and name df_solution. Also, the df_solution is saved in CSV file with name $file_name.$

## `save_parameters_json(par,file_name) `

Save the data frame of parameters $par$ in the json file with name $file_name$ that concatenate to this the current date. 






# References

1. "Julia Programming for Operations Research" by Changhyun Kwon and Youngdae Cho: This book focuses on using Julia for solving optimization problems and is suitable for readers with a background in operations research or mathematical optimization.

2. "Julia High Performance" by Avik Sengupta: This book covers various techniques to write high-performance code in Julia, making the most of its just-in-time compilation and multiple dispatch features.

3. "Hands-On Design Patterns and Best Practices with Julia" by Tom Kwong: This book introduces design patterns and best practices for writing maintainable and efficient code in Julia.

4. "Think Julia: How to Think Like a Computer Scientist" by Ben Lauwens and Allen Downey: This beginner-friendly book takes a hands-on approach to learning Julia and covers fundamental programming concepts through practical examples and exercises.

5. "Learning Julia: Build high-performance applications for scientific computing" by Anshul Joshi and Rahul Lakhanpal: This book provides an introduction to Julia for scientific computing and covers topics such as data manipulation, visualization, and parallel computing.

6. WHO, A. (2020). WHO methods and data sources for life tables 1990–2019.
