# SSAC2020: An Optimization Approach to Roster Creation
Materials for Sloan Sports Analytics Conference 2020 workshop on optimization using Julia/JuMP. In this session, we will implement optimization models using the programming language Julia and the JuMP library.

Before this session, follow the preassignment below to setup Julia and JuMP if you would like to run the code on your own computer. The data files and notebook that we will can be downloaded above (`NBA_data_2018_2019.csv`, `NBA_data_2018_2019_playoffs.csv`, and `SSAC20 Julia and JuMP Tutorial.ipynb`.

## Preassignment Part 1: Install Julia

The first step is to install a recent version of Julia. Julia is a "high-level, high-performance dynamic programming language for technical computing", and JuMP is a library that allows us to easily formulate and solve optimization problems.

The current version is 1.3.1\. Versions of Julia for all platforms are available [here](https://julialang.org/downloads/).

### Install JuMP and Cbc in Julia

Installing packages in Julia is easy with the Julia package manager. To install a package, open Julia (click on the application icon to launch) and type `]` to enter the package manager.

Install the JuMP package (press enter to run the command):

```jl
(v1.3) pkg> add JuMP
```

Also install the Cbc package, which will be the backend mixed-integer optimization solver for our optimization problems.
```jl
(v1.3) pkg> add Cbc
```

## Preassignment Part 2: Install IJulia

IJulia is the Julia version of IPython/Jupyter, that provides a nice notebook interface to run julia code, together with text and visualization. Please follow the following steps.

First, install IJulia (note that this is case-sensitive).
```jl
(v1.3) pkg> add IJulia
```

Once the package is installed, you can launch an IJulia session by running:
```jl
julia> using IJulia
julia> notebook()
```
This will open a window in your browser. You can create a new notebook by clicking "New > Julia 1.3.1" in the upper right corner. 

Note: you may be prompted to install Jupyter when you first use IJulia. If so, go ahead and install it through the command line. Once it is installed, the notebook should launch normally. 

Reference: these instructions were adapted from [this tutorial](https://github.com/mitmath/julia-mit#installing-julia-and-ijulia).

## Preassignment Part 3: Solving a simple optimization problem

Let's try a simple optimization problem! Copy and paste the following JuMP code into the new IJulia notebook that you created. You can run the code by pressing the "Run" button in the top menu. It may take 1-2 minutes for your code to return an output since you are loading these packages for the first time. 

A solution should be returned with an objective value of 10.6.

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

