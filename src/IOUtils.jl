module IOUtils

@doc raw"""
    readdir(dir::AbstractString, key)

Return a list of all objects in `dir` that match `key`.
"""
function Base.readdir(dir::AbstractString, key)
    filter(x -> occursin(key, x), readdir(dir))
end # function


@doc raw"""
    readlines(filename::AbstractString, nlines::Int)
    readlines(filename::AbstractString, nlines::Int, skip::Int)

Read the first `nlines` lines of file `filename` as a Vector{String}.
If `skip` is provided, lines `skip+1:skip+nlines` are read instead.
"""
function Base.readlines(filename::AbstractString, nlines::Int)
    collect(Iterators.take(eachline(filename), nlines))
end # function

function Base.readlines(filename::AbstractString, nlines::Int, skip::Int)
    dropped = Iterators.drop(eachline(filename), skip)
    collect(Iterators.take(dropped, nlines))
end # function

end # module

