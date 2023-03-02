# HomogeneousVectors

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://cserteGT3.github.io/HomogeneousVectors.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://cserteGT3.github.io/HomogeneousVectors.jl/dev/)
[![Build Status](https://github.com/cserteGT3/HomogeneousVectors.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/cserteGT3/HomogeneousVectors.jl/actions/workflows/CI.yml?query=branch%3Amain)

HomogeneousVectors.jl is a package for easy 3D coordinate transformation.
It's main purpose is to give an easily usable interface for one-time transformations.
If many vectors need transformations, it is maybe more convinient to use 4 long `SVector`s.

Here's an example for usage:

```julia
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

## Design details

The main idea behind the package is, that many times 3 long vectors are used and it would be inconvinient ti always add a 4th `1` element for homogeneous transformations.
Therefore the type `HomogeneousVector` (or shortly `HV`) wraps the vector, and by multiplying in with a homogeneous matrix, a vector of the original type is returned.

Homogeneous matrixes types are aliases for [StaticArrays](https://github.com/JuliaArrays/StaticArrays.jl) matrixes and are available as:

* `StaticHomogeneousMatrix{T}` (or `SHM`): is an alias for `SMatrix{4,4,T,16}` and is static.
* `MutableHomogeneousMatrix{T}` (or `MHM`): is an alias for `MMatrix{4,4,T,16}` and is mutable.

Convinience constructors are available as shown in the above example: `SHM(rotationmatrix, translationvector)` and `MHM(rotationmatrix, translationvector)`.
Further constructors are planned.
