using Distributions

include("get_stencil_projection.jl")

"""
    get_vaccine_action!(X_c, t, parameters)

Compute iteratively the control of Vaccine stock model that correspond with the percentage of vaccine coverage population
between the last delivery time and t.

# Arguments
- `X_c::Float`: Current coverage population at time t  
- `t::Float`: time
- `parameters::DataFrame`: current parameters.
...
"""

function get_vaccine_action!(X_C::Float64, t::Float64, parameters)
    #
    id = get_stencil_projection(t, parameters)
    t_initial_interval = parameters.t_delivery[id - 1]
    t_horizon = t - t_initial_interval  
    psi_v = -log(1.0 - X_C) / (t_horizon)
    a_t = psi_v 
    parameters.psi_v[id - 1] = psi_v
    # print("psi v ", parameters.psi_v)
    return a_t
end
