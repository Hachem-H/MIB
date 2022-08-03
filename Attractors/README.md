# Attractors

In maths, we tend to describe systems by their state and their evolution. An attractor is a type of system described by the mathematical field of dynamical systems as set of state, towards which a system tends to evolve.  For our case, we will be focusing mostly on a type of attractor namely, the Strange Attractor.

An attractor is called  "strange" when it possesses some fractal like structure which is often the case in chaotic systems. Most of the type, those attractors are diffentiable and can be written in the form of a system of differencial equations in respect to $x, y, z$. 

## Lorenz's attractor

One of the most famous attractors is the Lorenz system, commonly defined as the set of the following equations:

$$
\begin{align}
\frac{dx}{dt} &= \sigma(y-x) \\
\frac{dy}{dt} &= x(\rho-z)-y \\
\frac{dz}{dt} &= xy-\beta z
\end{align}
$$

with the paramaters being:

$$
\begin{align}
\sigma &= 10         \\
\beta &= \frac{8}{3} \\
\rho &= 28
\end{align}
$$

## Rössler's attractor

Otto Rössler, a german biochemist, started studying chaotic systems and thus created a system of equations to which he studied and modified to behave similarly to the Lorenz attractor.

$$
\begin{align}
\frac{dx}{dt} &= -y-z \\
\frac{dy}{dt} &= x+ay \\
\frac{dz}{dt} &= b+z(x-c)
\end{align}
$$

with the **original** paramaters being: _(they later have been modified)_

$$
\begin{align}
a &= 0.2 \\
b &= 0.2 \\
c &= 5.7
\end{align}
$$

## Halvorsen's symmetric attractor
Many visual designers must be familiar with this one as its 3 way symmatry and resemblence to impossible solids has quite a stunning outcome.

$$
\begin{align}
\frac{dx}{dt} &= -ax-4y-4z-y^2 \\
\frac{dy}{dt} &= -ay-4z-4x-z^2 \\
\frac{dz}{dt} &= -az-4x-4y-x^2 \\
\end{align}
$$

with $a = 1.89$

## Sprott
Julian C. Sprott is a phycist intrested in the evolution of chaotic systems, and as a concequence he had numerous seminars and books based off the topic.

$$
\begin{align}
\frac{dx}{dt} &= (z-b)x - dy \\
\frac{dy}{dt} &= dx + (z-b)y  \\
\frac{dz}{dt} &= c + az - \frac{z^3}{3} - (x^2+y^2)(1+ez)+fzx^3 \\
\end{align}
$$

with the paramaters being: 

$$
\begin{align}
a &= 0.95  \\
b &= 0.7 \\
c &= 0.6 \\
d &= 3.5 \\
e &= 0.25 \\
f &= 0.1 \\
\end{align}
$$

## The Four Wing Attractor
An attractor inspired by Lorenz original design

$$
\begin{align}
\frac{dx}{dt} &= ax+yz \\
\frac{dy}{dt} &= bx+cy-xz \\
\frac{dz}{dt} &= -z-xy \\
\end{align}
$$

with the paramaters being: 

$$
\begin{align}
a &= 0.2 \\
b &= 0.01 \\
c &= -0.4
\end{align}
$$
