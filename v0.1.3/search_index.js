var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = HomogeneousVectors","category":"page"},{"location":"#HomogeneousVectors","page":"Home","title":"HomogeneousVectors","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for HomogeneousVectors.","category":"page"},{"location":"#Intended-usage","page":"Home","title":"Intended usage","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The package is designed to be used the following way. When a 3D vector needs to be transformed with a homogeneous transformation matrix, it should be wrapped in a HV type, then transformed.","category":"page"},{"location":"","page":"Home","title":"Home","text":"For an example, assume the following two vectors:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> using HomogeneousVectors\n\njulia> using StaticArrays, LinearAlgebra\n\njulia> v1 = [1.0, 2.0, 3.0]\n3-element Vector{Float64}:\n 1.0\n 2.0\n 3.0\n\njulia> sv1 = SVector(1.0, 2.0, 3.0)\n3-element SVector{3, Float64} with indices SOneTo(3):\n 1.0\n 2.0\n 3.0","category":"page"},{"location":"","page":"Home","title":"Home","text":"An the following homogeneoun transformation matrix:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> hm1 = SHM(I(3), [-1.0, -2.0, -3.0])\n4×4 SMatrix{4, 4, Float64, 16} with indices SOneTo(4)×SOneTo(4):\n 1.0  0.0  0.0  -1.0\n 0.0  1.0  0.0  -2.0\n 0.0  0.0  1.0  -3.0\n 0.0  0.0  0.0   1.0","category":"page"},{"location":"","page":"Home","title":"Home","text":"The two vectors can be transformed by wrapping them into HVs and multiplying them with the matrix:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> HV(v1)*hm1\n3-element Vector{Float64}:\n 0.0\n 0.0\n 0.0\n\njulia> HV(sv1)*hm1\n3-element SVector{3, Float64} with indices SOneTo(3):\n 0.0\n 0.0\n 0.0","category":"page"},{"location":"","page":"Home","title":"Home","text":"Note, that type T of HV{T} is forced on the result, which may result in error, see the following example:","category":"page"},{"location":"","page":"Home","title":"Home","text":"julia> HV([1,2,3])*SHM(I(3), [-1.5, 0, 0])\nERROR: InexactError: Int64(-0.5)","category":"page"},{"location":"","page":"Home","title":"Home","text":"It is because HV wraps around a vector of integers, but the result will be a vector of floats, which can not be converted back to vector of integers. This limitation is currently unavoidable, one must think forward, to use the proper types.","category":"page"},{"location":"#Available-types","page":"Home","title":"Available types","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"HomogeneousVector\nStaticHomogeneousMatrix\nStaticHomogeneousMatrix(rotationmatrix, translationvector)\nMutableHomogeneousMatrix\nMutableHomogeneousMatrix(rotationmatrix, translationvector)","category":"page"},{"location":"#HomogeneousVectors.HomogeneousVector","page":"Home","title":"HomogeneousVectors.HomogeneousVector","text":"HomogeneousVector{T<:AbstractArray}\n\nOr HV{T} shortly. A wrapper around a 3 long vector with type {T}. Multiplying it with a StaticHomogeneousMatrix or MutableHomogeneousMatrix return a 3 long vector with type {T}.\n\n\n\n\n\n","category":"type"},{"location":"#HomogeneousVectors.StaticHomogeneousMatrix","page":"Home","title":"HomogeneousVectors.StaticHomogeneousMatrix","text":"StaticHomogeneousMatrix{T} = SMatrix{4,4,T,16}\n\nOr SMH shortly. Stores an unmutable 4x4 matrix.\n\n\n\n\n\n","category":"type"},{"location":"#HomogeneousVectors.StaticHomogeneousMatrix-Tuple{Any, Any}","page":"Home","title":"HomogeneousVectors.StaticHomogeneousMatrix","text":"StaticHomogeneousMatrix(rotationmatrix, translationvector)\n\nConstruct a StaticHomogeneousMatrix by taking a 3x3 rotation matrix, and a 3 long translation vector.\n\n\n\n\n\n","category":"method"},{"location":"#HomogeneousVectors.MutableHomogeneousMatrix","page":"Home","title":"HomogeneousVectors.MutableHomogeneousMatrix","text":"MutableHomogeneousMatrix{T} = MMatrix{4,4,T,16}\n\nOr MMH shortly. Stores a mutable 4x4 matrix.\n\n\n\n\n\n","category":"type"},{"location":"#HomogeneousVectors.MutableHomogeneousMatrix-Tuple{Any, Any}","page":"Home","title":"HomogeneousVectors.MutableHomogeneousMatrix","text":"MutableHomogeneousMatrix(rotationmatrix, translationvector)\n\nConstruct a MutableHomogeneousMatrix by taking a 3x3 rotation matrix, and a 3 long translation vector.\n\n\n\n\n\n","category":"method"},{"location":"","page":"Home","title":"Home","text":"Shorthands:","category":"page"},{"location":"","page":"Home","title":"Home","text":"HV\nSHM\nMHM","category":"page"},{"location":"#HomogeneousVectors.HV","page":"Home","title":"HomogeneousVectors.HV","text":"HV{T} = HomogeneousVector{T}\n\nShorthand for HomogeneousVector.\n\n\n\n\n\n","category":"type"},{"location":"#HomogeneousVectors.SHM","page":"Home","title":"HomogeneousVectors.SHM","text":"SHM{T} = StaticHomogeneousMatrix{T}\n\nShorthand for StaticHomogeneousMatrix.\n\n\n\n\n\n","category":"type"},{"location":"#HomogeneousVectors.MHM","page":"Home","title":"HomogeneousVectors.MHM","text":"MHM{T} = MutableHomogeneousMatrix{T}\n\nShorthand for MutableHomogeneousMatrix.\n\n\n\n\n\n","category":"type"}]
}
