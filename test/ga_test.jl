using Test
include("../src/ga.jl")

a = BitArray([1, 1, 0, 0, 1, 1, 0, 1])
b = BitArray([0, 0, 1, 0, 0, 1, 0, 0])

# @test crossover1(a, b, 1) == BitArray([1, 0, 1, 0, 0, 1, 0, 0]), BitArray([0, 1, 0, 0, 1, 1, 0, 1])

# File: MyProject/test/runtests.jl
using Test
using MyProject  # Import the module you want to test

@testset "crossover1 tests" begin
    # Test case 1: Basic crossover
    gene1 = [1, 2, 3, 4, 5]
    gene2 = [6, 7, 8, 9, 10]
    point = 2
    child1, child2 = crossover1(gene1, gene2, point)
    @test child1 == [1, 2, 8, 9, 10]
    @test child2 == [6, 7, 3, 4, 5]

    # Test case 2: Crossover at the start
    gene1 = [1, 2, 3]
    gene2 = [4, 5, 6]
    point = 0
    child1, child2 = crossover1(gene1, gene2, point)
    @test child1 == [4, 5, 6]
    @test child2 == [1, 2, 3]

    # Test case 3: Crossover at the end
    gene1 = [1, 2, 3]
    gene2 = [4, 5, 6]
    point = 2
    child1, child2 = crossover1(gene1, gene2, point)
    @test child1 == [1, 2, 6]
    @test child2 == [4, 5, 3]

    # Test case 4: Crossover with different lengths (should fail)
    gene1 = [1, 2, 3]
    gene2 = [4, 5]
    point = 1
    @test_throws AssertionError crossover1(gene1, gene2, point)

    # Test case 5: Edge case with empty genes
    gene1 = Int[]
    gene2 = Int[]
    point = 0
    child1, child2 = crossover1(gene1, gene2, point)
    @test child1 == Int[]
    @test child2 == Int[]
end


@testset "crossover2 tests" begin
    # Test case 1: Basic crossover
    gene1 = [1, 2, 3, 4, 5]
    gene2 = [6, 7, 8, 9, 10]
    point = 2
    child1, child2 = crossover2(gene1, gene2, point)
    @test child1 == [1, 2, 8, 9, 10]
    @test child2 == [6, 7, 3, 4, 5]

    # Test case 2: Crossover at the start
    gene1 = [1, 2, 3]
    gene2 = [4, 5, 6]
    point = 0
    child1, child2 = crossover2(gene1, gene2, point)
    @test child1 == [4, 5, 6]
    @test child2 == [1, 2, 3]

    # Test case 3: Crossover at the end
    gene1 = [1, 2, 3]
    gene2 = [4, 5, 6]
    point = 2
    child1, child2 = crossover2(gene1, gene2, point)
    @test child1 == [1, 2, 6]
    @test child2 == [4, 5, 3]

    # Test case 4: Invalid crossover point (negative)
    gene1 = [1, 2, 3]
    gene2 = [4, 5, 6]
    point = -1
    @test_throws AssertionError crossover2(gene1, gene2, point)

    # Test case 5: Invalid crossover point (out of bounds)
    gene1 = [1, 2, 3]
    gene2 = [4, 5, 6]
    point = 3
    @test_throws AssertionError crossover2(gene1, gene2, point)

    # Test case 6: Crossover with empty genes
    gene1 = Int[]
    gene2 = Int[]
    point = 0
    child1, child2 = crossover2(gene1, gene2, point)
    @test child1 == Int[]
    @test child2 == Int[]
end
