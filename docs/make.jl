push!(LOAD_PATH, "../src/")
using Documenter
using VaccineStockManagementWithMDPs

makedocs(
    sitename = "VaccineStockManagementWithMDPs",
    format = Documenter.HTML(),
    modules = [VaccineStockManagementWithMDPs]
)

mathengine = MathJax3(Dict(
    :loader => Dict("load" => ["[tex]/physics"]),
    :tex => Dict(
        "inlineMath" => [["\$","\$"], ["\\(","\\)"]],
        "tags" => "ams",
        "packages" => ["base", "ams", "autoload", "physics"],
    ),
)),

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo="https://github.com/Yofr3H/VaccineStockManagementWithMDPs.jl.git"
)
