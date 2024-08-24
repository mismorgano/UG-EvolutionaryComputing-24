import Statistics: mean

# function shrink(simplex, σ)
#     x₁ = simplex[1]
#     x₁ + σ*()
# end

function neldermead!(f, simplex, Niter)
    sort!(simplex, by=f)
    points = []
    for i = 1:Niter
        # initialization
        xₒ = mean(simplex[1:end-1])
        x₁ = simplex[1]
        xₙ = simplex[end-1]
        xₙ₊₁ = simplex[end]

        push!(points, x₁)

        α = 1
        γ = 2
        ρ = 1 / 2
        σ = 1 / 2

        # reflexion vertex
        xᵣ = xₒ + α * (xₒ - xₙ₊₁)
        if f(xᵣ) < f(x₁) # mejor que el mejor
            # expansion
            xₑ = xₒ + γ * (xᵣ - xₒ)
            if f(xₑ) < f(xᵣ)
                pushfirst!(simplex, xₑ)
            else
                pushfirst!(simplex, xᵣ)
            end
            pop!(simplex)
        elseif f(xᵣ) < f(xₙ) # entre los mejores n
            # reflexion
            index = searchsortedfirst(simplex, xᵣ, by=f)
            insert!(simplex, index, xᵣ)
            pop!(simplex)
        elseif f(xᵣ) < f(xₙ₊₁) # peor que los primero pero mejor que el peor
            # outside contraction 
            xₜ = xₒ + ρ * (xᵣ - xₒ)
            if f(xₜ) < f(xᵣ)
                simplex[end] = xₜ
            else
                # shrink
                g = x -> x₁ + σ * (x - x₁)
                simplex[2:end] = g.(simplex[2:end])
                sort!(simplex, by=f)
            end
        else # peor que el peor
            #inside contraction
            xₜ = xₒ + ρ * (xₙ₊₁ - xₒ)
            if f(xₜ) < f(xₙ₊₁)
                simplex[end] = xₜ
            else
                # shrink
                g = x -> x₁ + σ * (x - x₁)
                simplex[2:end] = g.(simplex[2:end])
                sort!(simplex, by=f)
            end
        end

    end

    return simplex, points

end

function neldermead(f, simplex, Niter)
    new_simplex = deepcopy(simplex)
    neldermead!(f, new_simplex, Niter)
end

