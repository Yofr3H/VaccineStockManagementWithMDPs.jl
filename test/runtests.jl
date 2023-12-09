using VaccineStockManagementWithMDPs
using Test
using PlotlyJS
using DataFrames
using CSV

@testset "VaccineStockManagementWithMDPs.jl" begin
    @test(
        VaccineStockManagementWithMDPs.
            greet_vaccine_stock_management_with_mdps() =="Hello VaccineStockManagementWithMDPs!"
    )
    p = VaccineStockManagementWithMDPs.load_parameters()
    p_sto = VaccineStockManagementWithMDPs.get_stochastic_perturbation()
    t = 90.0
    a_t = 0.25
    k = .0015
    S = p.S_0[1]
    E = p.E_0[1]
    I_S = p.I_S_0[1]
    I_A = p.I_A_0[1]
    R = p.R_0[1]
    D = p.D_0[1]
    V = p.V_0[1]
    X_vac = p.X_vac_interval[1]
    X_0_mayer = p.X_0_mayer[1]
    K_stock = p.k_stock[1]
    CL = sum([S, E, I_S, I_A, R, D, V])
    opt_policy = 1.0
    header_strs = [
        "t", "S", "E", "I_S",
        "I_A", "R", "D", "V", "CL",
        "X_vac", "X_0_mayer", "K_stock",
        "action", "opt_policy"
    ]
    x_0_vector = [
        t, S, E,
        I_S, I_A, R,
        D, V, CL,
        X_vac, X_0_mayer, K_stock,
        a_t, opt_policy
    ]
    x_df = DataFrame(
        Dict(
            zip(header_strs, x_0_vector)
        )    
    )
    x_new = 
        VaccineStockManagementWithMDPs.rhs_evaluation!(
            t, x_df, opt_policy,a_t, k, p
         )
    x_c = 
        VaccineStockManagementWithMDPs.get_vaccine_stock_coverage(
            k,p
        )

    x_new_df =  DataFrame(
        Dict(
            zip(header_strs, x_new)
        )
    )
    k_0 = p.k_stock[1] / p.N[1]
    time_horizon_1 = p.t_delivery[2]
    N_grid_size = p.N_grid_size[1]
    t_interval_1 = LinRange(0, time_horizon_1, N_grid_size)
    #x01, df1 = VaccineStockManagementWithMDPs.get_solution_path!(p)
    #@test((x01.D[1] + x01.E[1] + x01.I_A[1] + x01.I_S[1] + x01.R[1] + x01.S[1] + x01.V[1]) == x01.CL[1]
    #)
    sol_1 = VaccineStockManagementWithMDPs.get_interval_solution!(
                   t_interval_1,
                   x_df,
                   opt_policy, 
                   a_t,
                   k_0,
                   p
               )
    opt_sol_1 = sol_1
    prefix = "df_sol_"
    sufix = "1.csv"
    file = "./" * prefix * sufix #"./data/" * prefix * sufix
    df_sol_1 = VaccineStockManagementWithMDPs.save_interval_solution(
        t_interval_1,
        opt_sol_1;
        file_name = file
    )
    rand_p = VaccineStockManagementWithMDPs.get_stochastic_perturbation()
    @test(
        rand_p.t_delivery[2] <= rand_p.t_delivery[3] 
    ) 
    @test(
        df_sol_1.time[end] == 80.0
    )
    @test(
        sol_1[end,13] == 0.023156632531811085          
    )
    #VaccineStockManagementWithMDPs.get_solution_path!(p)
    @test(
        VaccineStockManagementWithMDPs.get_vaccine_stock_coverage(k,p) == 0.0014243754403948964 
    )
    @test(
        VaccineStockManagementWithMDPs.get_vaccine_action!(x_c,t,p) == 1.5837675860020853e-5
    )
    @test(
        VaccineStockManagementWithMDPs.load_parameters().N_grid_size[1] == 500
    )
    @test VaccineStockManagementWithMDPs.get_stencil_projection(t, p) == 2 
    @test sum(x_new[2:8]) == 1.0
    @test p.t_delivery[2] != p_sto.t_delivery[2]
    @test(
        VaccineStockManagementWithMDPs.compute_cost(x_df, p) == 
        999999.9621877202
    )
end