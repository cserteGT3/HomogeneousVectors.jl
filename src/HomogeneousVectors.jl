module HomogeneousVectors

using StaticArrays
using LinearAlgebra: I, mul!
import Base: *


export  HomogeneousVector,
        StaticHomogeneousMatrix,
        MutableHomogeneousMatrix,
        HV,
        SHM,
        MHM

    """
        HomogeneousVector{T<:AbstractArray}
    
    Or `HV{T}` shortly.
    A wrapper around a 3 long vector with type {T}.
    Multiplying it with a `StaticHomogeneousMatrix` or `MutableHomogeneousMatrix`
    return a 3 long vector with type {T}.
    """
    struct HomogeneousVector{T<:AbstractArray}
        v::T
        # add length check in inner constructor
    end

    # HomogeneousMatrix is an alias for 4x4 matrix
    """
        StaticHomogeneousMatrix{T} = SMatrix{4,4,T,16}
    
    Or `SMH` shortly.
    Stores an unmutable 4x4 matrix.
    """
    const StaticHomogeneousMatrix{T} = SMatrix{4,4,T,16}
    """
        MutableHomogeneousMatrix{T} = MMatrix{4,4,T,16}
    
    Or `MMH` shortly.
    Stores a mutable 4x4 matrix.
    """
    const MutableHomogeneousMatrix{T} = MMatrix{4,4,T,16}

    # short names for convinience
    """
        HV{T} = HomogeneousVector{T}
    
    Shorthand for [`HomogeneousVector`](@ref).
    """
    const HV{T} = HomogeneousVector{T}

    """
        SHM{T} = StaticHomogeneousMatrix{T}

    Shorthand for [`StaticHomogeneousMatrix`](@ref).
    """
    const SHM{T} = StaticHomogeneousMatrix{T}

    """
        MHM{T} = MutableHomogeneousMatrix{T}

    Shorthand for [`MutableHomogeneousMatrix`](@ref).
    """
    const MHM{T} = MutableHomogeneousMatrix{T}

    const HM = Union{StaticHomogeneousMatrix,MutableHomogeneousMatrix}

    # convinience constructors for homogeneous matrices
    """
        StaticHomogeneousMatrix(rotationmatrix, translationvector)
    
    Construct a [`StaticHomogeneousMatrix`](@ref) by taking a 3x3 rotation matrix,
    and a 3 long translation vector.
    """
    function StaticHomogeneousMatrix(rotationmatrix, translationvector)
        StaticHomogeneousMatrix(vcat(hcat(rotationmatrix, translationvector), [0 0 0 1]))
    end

    """
        MutableHomogeneousMatrix(rotationmatrix, translationvector)
    
    Construct a [`MutableHomogeneousMatrix`](@ref) by taking a 3x3 rotation matrix,
    and a 3 long translation vector.
    """
    function MutableHomogeneousMatrix(rotationmatrix, translationvector)
        MutableHomogeneousMatrix(vcat(hcat(rotationmatrix, translationvector), [0 0 0 1]))
    end

    function Base.:*(v::HomogeneousVector{T}, m::HM) where {T}
        rotmat = @view m[1:3, 1:3]
        translation = @view m[1:3, 4]
        result = MVector{3, eltype(translation)}(translation)
        mul!(result, rotmat, v.v, 1, 1)
        return T(result)
    end
end
