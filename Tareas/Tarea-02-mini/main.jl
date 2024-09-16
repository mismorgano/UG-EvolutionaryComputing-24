using GLMakie
include("../../src/ga.jl")

function crossover_test2(p1, p2, xlim, ylim)
    p1 = tobitarray.(p1, 16, [xlim, ylim])
    p2 = tobitarray.(p2, 16, [xlim, ylim])
    p1, p2 = vcat(p1...), vcat(p2...)

    xs, ys = [], []
    for i in 1:31
        chi1, chi2 = crossover1(p1, p2, i)
        x, y = bitarraytoint.([chi1, chi2]) / (2^32 - 1) * 10
        push!(xs, x)
        push!(ys, y)
    end
    f = Figure()
    ax = Axis(f[1, 1], limits=(0, 10, 0, 10), aspect=1)
    scatter!(ax, xs, ys, color=:blue)

    xs, ys = [], []
    for i in 1:30
        for j in i+2:31
            chi1, chi2 = crossover2(p1, p2, i, j)
            println(chi1, chi2)
            x, y = bitarraytoint.([chi1, chi2]) / (2^32 - 1) * 10
            push!(xs, x)
            push!(ys, y)
        end
    end
    println(xs)
    ax2 = Axis(f[1, 2], limits=(0, 10, 0, 10), aspect=1)
    scatter!(ax2, xs, ys, color=:red)
    f
end

function crossover_test(p1, p2, xlim, ylim)
    p1 = tobitarray.(p1, 16, [xlim, ylim])
    p2 = tobitarray.(p2, 16, [xlim, ylim])

    xs, ys = [], []
    for i in 1:15
        g1, g2 = crossover1.(p1, p2, i)
        for child in [[g1[1], g2[1]], [g1[2], g2[2]]]

            x, y = bitarraytoint.(child) / (2^16 - 1) * 10
            push!(xs, x)
            push!(ys, y)
        end
    end
    f = Figure()
    ax = Axis(f[1, 1], limits=(0, 10, 0, 10), aspect=1)
    scatter!(ax, xs, ys, color=:blue)

    xs, ys = [], []
    for i in 1:14
        for j in i+1:15
            g1, g2 = crossover2.(p1, p2, i, j)
            for child in [[g1[1], g2[1]], [g1[2], g2[2]]]
                x, y = bitarraytoint.(child) / (2^16 - 1) * 10
                push!(xs, x)
                push!(ys, y)
            end
        end
    end
    println(xs)
    ax2 = Axis(f[1, 2], limits=(0, 10, 0, 10), aspect=1)
    scatter!(ax2, xs, ys, color=:red)
    f
end

function main()

    # crossover tipo 1
    # a = BitArray(rand(0:1, 16))
    # b = BitArray(rand(0:1, 16))
    # a = rsplit(bitstring(round(2 * (2^16 - 1) / 10)), "")[1:16]
    # b = 3 * (2^16 - 1) / 10 |> round |> bitstring |> x -> rsplit(x, "", limit=16)
    a = inttobitarray(2, 16, [0, 10])
    b = inttobitarray(3, 16, [0, 10])
    parent1 = [a, b]
    println(bitarraytoint.(parent1) / (2^16) * 10)

    a = inttobitarray(6, 16, [0, 10])
    b = inttobitarray(7, 16, [0, 10])
    parent2 = [a, b]
    println(bitarraytoint.(parent2) / (2^16) * 10)
    xs = []
    ys = []
    for i in 1:15
        g1, g2 = crossover1.(parent1, parent2, i)
        for child in [[g1[1], g2[1]], [g1[2], g2[2]]]
            x, y = bitarraytoint.(child) / (2^16 - 1) * 10
            push!(xs, x)
            push!(ys, y)
        end
    end
    println(length(xs))
    f = Figure()
    ax = Axis(f[1, 1], limits=(0, 10, 0, 10), aspect=1)
    scatter!(ax, xs, ys, color=:blue)

    xs = []
    ys = []

    for i in 1:14
        for j in i+1:15
            g1, g2 = crossover2.(parent1, parent2, i, j)
            for child in [[g1[1], g2[1]], [g1[2], g2[2]]]
                x, y = bitarraytoint.(child) / (2^16 - 1) * 10
                push!(xs, x)
                push!(ys, y)
            end
        end
    end
    println(length(xs))
    ax2 = Axis(f[1, 2], limits=(0, 10, 0, 10), aspect=1)
    scatter!(ax2, xs, ys, color=:red)
    f
    # println(parent1, parent2)
    # ch1, ch2 = crossover(parent1, parent2, "1")
    # println(ch1, ch2)
    # x, y = bitarraytoint.(ch1) / (2^16 - 1) * 10
    # plot([x], [y])
end