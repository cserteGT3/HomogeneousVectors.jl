using HomogeneousVectors
using Documenter

DocMeta.setdocmeta!(HomogeneousVectors, :DocTestSetup, :(using HomogeneousVectors); recursive=true)

makedocs(;
    modules=[HomogeneousVectors],
    authors="Tamás Cserteg <csertegt@gmail.com> and contributors",
    repo="https://github.com/cserteGT3/HomogeneousVectors.jl/blob/{commit}{path}#{line}",
    sitename="HomogeneousVectors.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://cserteGT3.github.io/HomogeneousVectors.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/cserteGT3/HomogeneousVectors.jl",
    devbranch="main",
)
