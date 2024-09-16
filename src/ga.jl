
function crossover1(gene1, gene2, point)
    @assert length(gene1) == length(gene2) "Cannot crossover genes"
    n = length(gene1)
    child1, child2 = copy(gene1), copy(gene2)
    child1[point+1:end], child2[point+1:end] = gene2[point+1:end], gene1[point+1:end]
    child1, child2
end
function crossover2(g1, g2, p1, p2)
    @assert length(g1) == length(g2) "Cannot crossover genes"
    @assert p1 < p2
    ch1, ch2 = copy(g1), copy(g2)
    ch1[p1+1:p2], ch2[p1+1:p2] = g2[p1+1:p2], g1[p1+1:p2]
    ch1, ch2
end

function crossoverU(g1, g2)
    @assert length(g1) == length(g2) "Cannot crossover genes"
    n = length(g1)

end

function crossovergene(gene1, gene2, type)
    n = length(gene1)
    rang = 1:n-1
    child1, child2 = copy(gene1), copy(gene2)
    if type == "1"
        point = rand(rang)
        child1[point+1:end], child2[point+1:end] = gene2[point+1:end], gene1[point+1:end]
    elseif type == "2"
        p1, p2 = rand(rang, 2)
        child1[p1+1:p2], child2[p1+1:p2] = gene2[p1+1:p2], gene1[p1+1:p2]
    elseif type == "U"
        for i in 1:n
            if rand() <= 5
                child1[i] = gene1[i]
            else
                child2[i] = gene2[i]
            end
        end
    end
    child1, child2
end

function crossover(parent1, parent2, type)
    child1, child2 = [], []
    if type == "1"
        for (gene1, gene2) in zip(parent1, parent2)
            n = length(gene1)
            point = rand(1:n-1)
            ch1, ch2 = crossover1(gene1, gene2, point)
            push!(child1, ch1)
            push!(child2, ch2)
        end
    elseif type == "2"
        p1, p2 = rand(rang, 2)
        child1[p1+1:p2], child2[p1+1:p2] = parent2[p1+1:p2], parent1[p1+1:p2]
    elseif type == "U"

    end
    child1, child2

end

function tobitarray(n, nbits, interval)
    a, b = interval
    
    @assert a < b "The interval should be valid"
    @assert all(a <= n <= b) "n should be in interval"
    n * (2^nbits - 1) / (b - a) |> ceil |> Int |> x -> digits(x, base=2, pad=nbits) |> reverse |> BitArray
end

function bitarraytoint(bitarray)
    res = 0
    for bit in bitarray
        res = (res << 1) | Int(bit)
    end
    res
end

