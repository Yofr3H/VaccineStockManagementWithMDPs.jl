push!(LOAD_PATH, "../src/")
using Documenter
using VaccineStockManagementWithMDPs

makedocs(
    modules = [VaccineStockManagementWithMDPs],
    format = Documenter.HTML(),
    sitename = "VaccineStockManagementWithMDPs",
    pages = [
        "Introduction" => [
            "preliminars.md"
            ],
     ],
    warnonly = [:missing_docs] 
    
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
