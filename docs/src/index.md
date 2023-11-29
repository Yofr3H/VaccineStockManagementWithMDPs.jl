# `VaccineStockManagementWithMDPs.jl`
```@meta
    CurrentModule = VaccineStockManagementWithMDPs 
```
## Concepts

```@contents
Pages = ["preliminars.md"]
```

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
## `get_interval_solution`

# `get_path_plot.jl`

# `get_solution_path.jl`



# `get_stochastic_perturbation.jl`


## `get_vaccine_action.jl`

## `get_vaccine_stock_coverage.jl`


## `load_parameters.jl`


## `rhs_evaluation.jl`

## `save_interval_solution.jl`

## `save_parameters_json.jl`







# References

1. "Julia Programming for Operations Research" by Changhyun Kwon and Youngdae Cho: This book focuses on using Julia for solving optimization problems and is suitable for readers with a background in operations research or mathematical optimization.

2. "Julia High Performance" by Avik Sengupta: This book covers various techniques to write high-performance code in Julia, making the most of its just-in-time compilation and multiple dispatch features.

3. "Hands-On Design Patterns and Best Practices with Julia" by Tom Kwong: This book introduces design patterns and best practices for writing maintainable and efficient code in Julia.

4. "Think Julia: How to Think Like a Computer Scientist" by Ben Lauwens and Allen Downey: This beginner-friendly book takes a hands-on approach to learning Julia and covers fundamental programming concepts through practical examples and exercises.

5. "Learning Julia: Build high-performance applications for scientific computing" by Anshul Joshi and Rahul Lakhanpal: This book provides an introduction to Julia for scientific computing and covers topics such as data manipulation, visualization, and parallel computing.

6. WHO, A. (2020). WHO methods and data sources for life tables 1990–2019.


