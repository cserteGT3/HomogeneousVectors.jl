```@meta
CurrentModule = HomogeneousVectors
```

# HomogeneousVectors

Documentation for [HomogeneousVectors](https://github.com/cserteGT3/HomogeneousVectors.jl).

## Intended usage

The package is designed to be used the following way.
When a 3D vector needs to be transformed with a homogeneous transformation matrix, it should be wrapped in a `HV` type, then transformed.

For an example, assume the following two vectors:
```julia-repl
julia> using HomogeneousVectors

julia> using StaticArrays, LinearAlgebra

julia> v1 = [1.0, 2.0, 3.0]
3-element Vector{Float64}:
 1.0
 2.0
 3.0

julia> sv1 = SVector(1.0, 2.0, 3.0)
3-element SVector{3, Float64} with indices SOneTo(3):
 1.0
 2.0
 3.0
```

An the following homogeneoun transformation matrix:
```julia-repl
julia> hm1 = SHM(I(3), [-1.0, -2.0, -3.0])
4×4 SMatrix{4, 4, Float64, 16} with indices SOneTo(4)×SOneTo(4):
 1.0  0.0  0.0  -1.0
 0.0  1.0  0.0  -2.0
 0.0  0.0  1.0  -3.0
 0.0  0.0  0.0   1.0
```

The two vectors can be transformed by wrapping them into `HV`s and multiplying them with the matrix:

```julia-repl
julia> HV(v1)*hm1
3-element Vector{Float64}:
 0.0
 0.0
 0.0

julia> HV(sv1)*hm1
3-element SVector{3, Float64} with indices SOneTo(3):
 0.0
 0.0
 0.0
```

Note, that type `T` of `HV{T}` is forced on the result, which may result in error, see the following example:

```julia-repl
julia> HV([1,2,3])*SHM(I(3), [-1.5, 0, 0])
ERROR: InexactError: Int64(-0.5)
```

It is because `HV` wraps around a vector of integers, but the result will be a vector of floats, which can not be converted back to vector of integers.
This limitation is currently unavoidable, one must think forward, to use the proper types.

## Available types

```@docs
HomogeneousVector
StaticHomogeneousMatrix
StaticHomogeneousMatrix(rotationmatrix, translationvector)
MutableHomogeneousMatrix
MutableHomogeneousMatrix(rotationmatrix, translationvector)
```

Shorthands:

```@docs
HV
SHM
MHM
```
