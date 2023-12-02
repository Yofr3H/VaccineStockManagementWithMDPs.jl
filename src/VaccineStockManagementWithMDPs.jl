# SPDX-License-Identifier: MIT
"""
Module for simulation of a Vaccine stock Management with 
Markov Decission Processes. See
(https://www.overleaf.com/read/hqmrsgtnfvkh)[https://www.overleaf.com/read/hqmrsgtnfvkh]
to details.
"""
module VaccineStockManagementWithMDPs
    using JSON, JSONTables, DataFrames, Distributions, CSV, PlotlyJS, LaTeXStrings
    using Dates, ProgressMeter
    export greet_vaccine_stock_management_with_mdps
    export compute_cost
    export get_charts
    export get_interval_solution
    export get_path_plot
    export get_solution_path
    export get_stencil_projection
    export get_stochastic_perturbation
    export get_vaccine_action!
    export get_vaccine_stock_coverage
    export load_parameters
    export rhs_evaluation!
    export save_interval_solution
    export save_parameters_json
    export save_solution
    include("compute_cost.jl")
    include("functions.jl")
    include("get_charts.jl")
    include("get_interval_solution.jl")
    include("get_path_plot.jl")
    include("get_solution_path.jl")
    include("get_stencil_projection.jl")
    include("get_stochastic_perturbation.jl")
    include("get_vaccine_action.jl")
    include("get_vaccine_stock_coverage.jl")
    include("load_parameters.jl")
    include("rhs_evaluation.jl")
    include("save_interval_solution.jl")
    include("save_parameters_json.jl")
    include("save_solution.jl")
end