using LabPressureController
using Documenter

DocMeta.setdocmeta!(LabPressureController, :DocTestSetup, :(using LabPressureController); recursive=true)

makedocs(;
    modules=[LabPressureController],
    authors="Jan Kuhfeld <jan@kuhfeld.net> and contributors",
    sitename="LabPressureController.jl",
    format=Documenter.HTML(;
        canonical="https://jqfeld.github.io/LabPressureController.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/jqfeld/LabPressureController.jl",
    devbranch="main",
)
