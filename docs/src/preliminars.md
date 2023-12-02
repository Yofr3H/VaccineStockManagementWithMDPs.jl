# Concepts
VaccineStockManagement.jl is a julia tool module that approximate the optimal policies of a vaccine inventory to aim the control of the vaccine overage when the size ant time of vaccine delivieries was defined previously but the real values are perturbed stochastically. Additionally to modelling the evolution of diseasse follows the compartment SERIDV epidemic model.

## Vaccine - counter - epidemic - $SEIRDX_{vac}$ model

We consider the epidemic model, given by the Ordinary Differential Equations system 

```math
    \begin{aligned}
        S ^ {\prime} &= 
            \mu \hat{N} 
                + \omega_V V 
                + \delta_R R
                - (\lambda_f + \mu + \psi_V) S 
                \\
        E ^ {\prime} &= 
            \lambda_f S 
            + (1- \epsilon) V - (\mu + \delta_E) E
        \\
        I_S ^ {\prime} &=
            p \delta_E E - (\mu + \alpha_S) I_S
        \\
        I_A ^ {\prime}  &= 
            (1- p)\delta_E E - (\mu + \alpha_A) I_A
        \\
        R ^ {\prime} &= 
            (1- \theta) \alpha_S 
            + \alpha_A I_A 
            -(\mu + \delta_R) R
        \\
        D ^ {\prime} &=
            \theta \alpha_S I_S 
        \\
        V ^ {\prime} &= 
            \psi_V S 
                - [
                    (1 - \epsilon ) \lambda_f  
                    + \omega _V 
                    + \mu
                ] V
            \\
        X_{vac} ^ {\prime} &= \psi_V (S + E + I_A + R) 
        \\
        \lambda_f &:= 
            \frac{\beta_S I_S + \beta_A I_A}{\widehat{N}}
        \\
        \widehat{N}(t) &= 
                S(t) + E(t) + I_S(t) + I_A(t) + R(t) + D(t) + V(t)
    \end{aligned}
```

for each time $t>0,$ where $S$ (Susceptible), $E$ (Exposed), $R$ (Recovered) , $D$ (Death), $I_A$ (Asymptomatic Infected ), $I_S$ (Symptomatic Infected), $V$ (vaccinated), $X_{vac}$ (number of accumulative administered doses until $t.$  The constants satisfies
(TODO: define constants)

and the usual condition 

```math
\begin{aligned}
    \hat{N}_n &= S +E+ I_A + I_S + R
\end{aligned}
```
and define 
```math
\begin{aligned}
    \lambda_f &= \beta_S I_S + \beta_A I_A,\\
    \psi(h) &= 1 - e^{-h} (1- \psi(h) \mu) I_A^n 
\end{aligned}
```

In addition, we consider a stock vaccination management. Let suppose a vaccine
inventory with finite steps $K$ (the steps in term of the deliveries), that is,
if $k$ represents the $k$-delivery of vaccine, $k=1,\dots,K.$

### Discretization $SEIRDX_{vac}$ model

To generate an optimal inventory vaccine problem, as first step, we apply a discretization of the ODE system $SEIRDVX_{vac}$ under the time-delivery sub intervals. Consider for each time sub-interval $k$  a grid time $N_k$ partition of sub interval $[t_{*}^{(k)},t^{*(k)}].$ We define

$h_k:= \frac{t^{*(k)} - t_{*}^{(k)}}{N_k}.$ 

If $t_n^{(k)}$ denotes the time of the $n$ step SEIR model for the $k$ sub interval, then

$t_n^{(k)} = nh_k \in [t_{*}^{(k)},t^{*(k)}], \quad \quad k=1,\dots, K.$

To validate the extremes, $t_0^{(k)}=t_{*}^{(k)}$ and $t_{N_k}^{(k)}=N_k h_k =t^{*(k)}.$