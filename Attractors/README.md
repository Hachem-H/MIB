# Mathematical Attractors: Definition and Types
Mathematical attractors are sets of values towards which a dynamic system tends to converge as time progresses. These values can be fixed points, limit cycles, or chaotic attractors. These particular attractors fall in the category of the latter. Chaotic attractors are complex, non-repeating patterns of behavior that arise in certain types of dynamic systems. Unlike fixed point and limit cycle attractors, chaotic attractors are highly sensitive to initial conditions. This means that small variations in the starting values of the system can lead to vastly different outcomes over time. One of the most famous examples of a chaotic attractor is the Lorenz attractor, which arises in a simplified model of atmospheric convection.A system of differential equations can be used to model the behavior of a dynamical system, including the evolution of the system over time towards its attractors.

A differential equation is an equation that describes the rate of change of a variable with respect to another variable. In a system of differential equations, multiple variables are described by a set of equations that depend on each other, creating a complex system of interactions.

To understand how attractors are modeled using a system of differential equations, consider a simple example of a pendulum. A pendulum is a system with a single degree of freedom that can be described by a second-order differential equation:

$$
\frac{d^2\theta}{dt^2} + \frac{g}{L}\sin\theta = 0
$$

where $\theta$ is the angle of the pendulum from its vertical rest position, $t$ is time, $g$ is the acceleration due to gravity, and $L$ is the length of the pendulum.

This equation describes how the angle $\theta$ changes over time, depending on the gravitational force and the length of the pendulum. If we solve this equation, we can see how the angle of the pendulum evolves over time, and we can identify the attractors of the system.

In this example, the attractors of the pendulum system are its stable and unstable equilibrium positions, which correspond to the vertical position and the inverted position of the pendulum, respectively. These positions are the states towards which the system tends to evolve over time.

# Code walkthrough
The code is organized into functions, with each function corresponding to a specific attractor. Creating your own attractor is a straightforward process, involving defining parameters and initial states, and specifying the differential equations. Here is an example code snippet that shows how to define your own attractor:

```processing
void YourAttractor()
{
	/* your paramaters go here */
	float a = 0.1;
	float b = 1.5;
	float c = 5;
	
	if (!ran)
	{
		/* your initial state goes here */
		x = 0.1;
		y = 0.2;
		ran = true; // very important line
	}
	
	/* differential equations right here (multiply it by dt) */
	dx = (ay - bx)      * dt;
	dy = (x * (z - cy)) * dt;
	dz = (x*y - az)     * dt;
}
```

To use your custom attractor, simply call your function inside the `draw()` function:

```processing
void draw()
{
	YourAttractor();
	/* ... */
}
```

