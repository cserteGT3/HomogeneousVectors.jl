module HomogeneousVectors

# v1
#import Base: size, getindex, setindex!, IndexStyle, iterate, length
#using LinearAlgebra: I
# v2
#import Base: *
# v3 and v4
using StaticArrays

#=
export  HV1, HM1

export  HM2, homtr

export  HV3, HM3

export  HV4, HM4

include("version1.jl")
include("version2.jl")
include("version3.jl")
include("version4.jl")
=#

export  HomogeneousVector,
        HomogeneousMatrix,
        invhm,
        transform3D

function HomogeneousVector(v)
    return SVector{4}(v..., 1)
end

function HomogeneousMatrix(m, v::AbstractVector)
    hm = hcat(m, v)
    hm = vcat(hm, [0 0 0 1])
    return SMatrix{4,4}(hm)
end

HomogeneousMatrix(v::AbstractVector) = HomogeneousMatrix(I, v)

function invhm(m)
    invtr = zeros(Float64,4,4)
    R = m[1:3, 1:3]
    invR = inv(R)
    invtr[1:3, 1:3] = invR
    invtr[1:3, 4] = -1*invR*m[1:3,4]
    return SMatrix{4,4}(invtr)
end

function transform3D(m, v)
    @assert length(v) == 3 "transform3D transform 3D, not homogeneous vectors"
    result = m*HomogeneousVector(v)
    return result[1:3]
end

end
