
using GLMakie
include("../../src/nelder_mead.jl")
include("../../src/optitest.jl")

function neldermead_test(f, simplex, Niter)
    println(f.(simplex))
    nsimplex, points = neldermead(f, simplex, Niter)
    println(f.(nsimplex))
    points
end

function plot2dpoints(func, points)
    x = getindex.(points, 1)
    y = getindex.(points, 2)
    f = Figure()
    ax = Axis(f[1, 1])
    ax.aspect = 1
    scatter!(ax, func.(points))
    f, ax
end

## test Space paper

simplex = [[1.0, 2.0], [2.0, 3.0], [4.0, 5.0]]
points = neldermead_test(spacepaper, simplex, 10)

f, ax = plot2dpoints(spacepaper, points)
f


## test B2 
simplex = [[-25.0, 75.0], [-10.0, 20.0], [30.0, 90.0]]
points = neldermead_test(b2, simplex, 10)
f, ax = plot2dpoints(b2, points)
f



# res = neldermead(g1, simplex, 10)
# println(res)
# f = Figure()
# ax = Axis(f[1, 1], limits=(0, 5, 0, 5))
# ax.aspect = 1
# x = getindex.(res, 1)
# y = getindex.(res, 2)
# scatter!(ax, x, y)
# f       