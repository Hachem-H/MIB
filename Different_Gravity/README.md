# What if gravity behaved differently?

Given two bodies floating in space, we can model the attraction forces between them using Newton's law of universal gravitation

$$
F=G\frac{m_1m_2}{d^2}
$$

with $G$ being the gravitational constant, $m_n$ the mass of the object and $d$ the distance between the two bodies. But this makes us think, what if gravity was different? what if $F$ was a reciprocal of $d$ not $d^2$? So I wrote this "Gravity Simulator" which allowed me to do just that. Inside the code, you will find a functoin defined as:

```java
float LawOfMotion(float m1, float m2, float d)
{
    return G * (m1*m2) / (d*d);
}
```

We of course corresponds to the original Newtonian law, but this also means that it allows us to change the law to what ever we please. It is quite difficult to find any other variation which is stable enough for it to be intresting but that is the beauty of experimentation is it not? _says I, a theoretical physicist_.

All the boring and annoying work of setting up the planets, the rendering code and all that jazz is already taken care of for you, so all you have to do to try something is to just change the provided function. Of course you can modify the engine code if you desire.
