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

        struct HomogeneousVector{T<:AbstractArray}
            v::T
            # add length check in inner constructor
        end

        # HomogeneousMatrix is an alias for 4x4 matrix
        const StaticHomogeneousMatrix{T} = SMatrix{4,4,T,16}
        const MutableHomogeneousMatrix{T} = MMatrix{4,4,T,16}

        # short names for convinience
        const HV = HomogeneousVector
        const SHM{T} = StaticHomogeneousMatrix{T}
        const MHM{T} = MutableHomogeneousMatrix{T}

        const HM = Union{StaticHomogeneousMatrix,MutableHomogeneousMatrix}

        # convinience constructors for homogeneous matrices
        function StaticHomogeneousMatrix(rotationmatrix, translationvector)
            StaticHomogeneousMatrix(vcat(hcat(rotationmatrix, translationvector), [0 0 0 1]))
        end

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
