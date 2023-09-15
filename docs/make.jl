using Documenter
using VaccineStockManagementWithMDPs

makedocs(
    sitename = "VaccineStockManagementWithMDPs",
    format = Documenter.HTML(),
    modules = [VaccineStockManagementWithMDPs]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
