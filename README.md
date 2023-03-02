# HomogeneousVectors

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://cserteGT3.github.io/HomogeneousVectors.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://cserteGT3.github.io/HomogeneousVectors.jl/dev/)
[![Build Status](https://github.com/cserteGT3/HomogeneousVectors.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/cserteGT3/HomogeneousVectors.jl/actions/workflows/CI.yml?query=branch%3Amain)


Intended usage is thw following:

```julia-repl
julia> using HomogeneousVectors

julia> v1 = [0, 1, 2]
3-element Vector{Int64}:
 0
 1
 2

julia> hm = SHM([1 0 0; 0 1 0; 0 0 1], [0, -1, -2])
4×4 SMatrix{4, 4, Int64, 16} with indices SOneTo(4)×SOneTo(4):
 1  0  0   0
 0  1  0  -1
 0  0  1  -2
 0  0  0   1

julia> vtransformed = HV(v1)*hm
3-element Vector{Int64}:
 0
 0
 0

```
