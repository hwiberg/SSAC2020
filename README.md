# SSAC2020: An Optimization Approach to Roster Creation
Materials for Sloan Sports Analytics Conference 2020 workshop on optimization using Julia/JuMP. In this session, we will implement optimization models using the programming language Julia and the JuMP library.

Julia is a "high-level, high-performance dynamic programming language for technical computing", and JuMP is a library that allows us to easily formulate optimization problems and solve them using a variety of solvers.

## Preassignment Part 1: Install Julia

The first step is to install a recent version of Julia. The current version is 1.3.1\. Versions of Julia for all platforms are available [here](https://julialang.org/downloads/).

### Install JuMP and Cbc in Julia

Installing packages in Julia is easy with the Julia package manager. To install a package, open Julia (click on the application icon to launch) and type `]` to enter the package manager.

Install the JuMP package:

```jl
(v1.3) pkg> add JuMP
```

Also install the Cbc package, which will be the backend mixed-integer optimization solver for our optimization problems.
```jl
(v1.3) pkg> add Cbc
```

## Preassignment Part 2: Install IJulia

IJulia is the Julia version of IPython/Jupyter, that provides a nice notebook interface to run julia code, together with text and visualization. Please follow the following steps (based on [this tutorial](https://github.com/mitmath/julia-mit#installing-julia-and-ijulia)): 

```jl
(v1.3) pkg> add IJulia
```

Once the package is installed, you can launch an IJulia session by running:
```jl
julia> using IJulia
julia> notebook()
```
This will open a window in your browser. You can navigate through your folders to find the notebook (.ipynb file) for this session and open it in IJulia, or you can create a new notebook by clicking "New > Julia 1.3.1" in the upper right corner.

Note: you may be prompted to install Jupyter when you first use IJulia. If so, go ahead and install it through the command line. Once it is installed, the notebook should launch normally. 

## Preassignment Part 3: Solving a simple LP

Let's try a simple LP! Enter the following JuMP code in a new IJulia notebook. A solution should be returned with an objective value of 10.6.

```jl
using JuMP, Cbc

m = Model(Cbc.Optimizer) 
@variable(m, 0 <= x <= 2 )
@variable(m, 0 <= y <= 30 )

@objective(m, Max, 5x + 3*y )
@constraint(m, 1x + 5y <= 3.0 )

print(m)

optimize!(m)

println("Objective value: ", objective_value(m))
println("x = ", value(x))
println("y = ", value(y))
```

## Questions?

Email hwiberg@mit.edu
