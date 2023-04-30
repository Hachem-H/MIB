# Gravitational Laws 

Newton's gravitational law states that every particle in the universe attracts every other particle with a force that is directly proportional to the product of their masses and inversely proportional to the square of the distance between them. This means that the force of gravity between two objects increases as their masses increase and decreases as the distance between them increases. The mathematical expression for this law is:
$$
F=G\frac{m_1m_2}{d^2}
$$


where $F$ is the force of gravity, $G$ is the gravitational constant, $m_1$ and $m_2$ are the masses of the two objects, and $d$ is the distance between them. If we even slightly changed Newton's gravitational law, it could have significant consequences for the behavior of objects in the universe.

## Code walk-through

The code is a simulation of a gravitational system, where multiple planets orbit around a central star (represented by the `sun` object). The simulation i built on a modified version of Newton's law of universal gravitation, where the gravitational constant $G$ is set to 100 (instead of the real-world value of $6.67 10^{-11}$ to make it easier to work with computationally. The function `F` calculates the gravitational force between two masses given their distance from each other.

The code defines a `Body` class, which represents a celestial body with a position, velocity, mass, and a trail (a list of previously visited positions). The `Attract` method in the Body class calculates the gravitational force between two bodies, and the resulting acceleration is added to the velocity of the attracted body.

To use your own law of attraction, simply modify the `F` function to suit your needs, for example:

```processing
float F(float mass1, float mass2, float distance)
{
	return G*(mass1*mass2)/pow(distance, 3);
}
```

