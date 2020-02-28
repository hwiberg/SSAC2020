# SSAC2020
Materials for Sloan Sports Analytics Conference 2020 workshop on optimization using Julia/JuMP.

# Optimization with Julia and JuMP

In this session, we will implement optimization models using the programming language Julia and the JuMP library.

Julia is a "high-level, high-performance dynamic programming language for technical computing", and JuMP is a library that allows us to easily formulate optimization problems and solve them using a variety of solvers.

## Preassignment - Install Julia and IJulia

The first step is to install a recent version of Julia. The current version is 1.3.1\. Binaries of Julia for all platforms are available [here](https://julialang.org/downloads/).

IJulia is the Julia version of IPython/Jupyter, that provides a nice notebook interface to run julia code, together with text and visualization. Please follow the instructions [here](https://github.com/stevengj/julia-mit#installing-julia-and-ijulia) to install Julia and set up IJulia.

## Preassignment - JuMP

For this class, we will be using the Cbc mixed-integer programming solver.

### Install JuMP and Cbc in Julia

Installing packages in Julia is easy with the Julia package manager. Just open Julia and enter the following command:

Install the JuMP package:

```jl
julia> Pkg.add("JuMP")
```

Also install the Cbc package, which will be the backend solver for our optimization problems.
```jl
julia> Pkg.add("Cbc")
```


## Preassignment - Solving a simple LP

Let's try a simple LP! Enter the following JuMP code in Julia and submit all the output to Stellar.

```jl
using JuMP, Cbc

m = Model(solver=GurobiSolver()) # replace this line by "m = Model()"" if Gurobi does not work
@variable(m, 0 <= x <= 2 )
@variable(m, 0 <= y <= 30 )

@objective(m, Max, 5x + 3*y )
@constraint(m, 1x + 5y <= 3.0 )

print(m)

status = solve(m)

println("Objective value: ", getobjectivevalue(m))
println("x = ", getvalue(x))
println("y = ", getvalue(y))
```

## Questions?

Email hwiberg@mit.edu
