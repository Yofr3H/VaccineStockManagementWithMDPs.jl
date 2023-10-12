"""
    save_solution(time, x,  parameters)

Compute the functional cost given the current 
state and action.

# Arguments
- `t::Float`: time 
- `x::DataFrame`: System current state
- `a_t::Float`: action, that is a proportion of the total jabs projected
  that would be administrated.
- `k::Float`: current level of the vaccine-stock.
- `parameters::DataFrame`: current parameters.
...
"""

function save_solution(time, x, 
        header_strs = 
            ["time", "S", "E",
            "I_S", "I_A", "R",
            "D", "V", "CL",
            "X_vac", "K_stock"],
        file_name = "solution_seirvd.csv"    
    )
data = [time x]
df_solution = ( 
    DataFrame(
        Dict(
            zip(
                header_strs,
                [data[:, i] for i in 1:size(data, 2)]
            )
        )
    )
)
CSV.write(file_name, df_solution)
return df_solution;
end