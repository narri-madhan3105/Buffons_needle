
# Estimating $\pi$ using Buffon's needle- A Monte Carlo Simulation
## Introduction:
~ Buffons Needle , a classical _Geometrical Probability_ problem solved by *Monte Carlo Simulation*
This method in which drop needles on parallel lines is one of the first Monte Carlo methods for estimating $\pi$ .
Infact Buffon's needle was one of the earliest problems in geometric probability to be solved.

The formula after simplifications and assumptions comes down to

$$
P   = \frac{2}{\pi}
$$ 

Let me go through you a small derivation for deeper understanding of method
<img width="402" height="358" alt="buffon ggl" src="https://github.com/user-attachments/assets/c6e4f2f7-4e82-4c22-856f-453220d97676" />

 where P is the final probability that a needle randomly dropped onto a surface will land across one of the parallel lines

keywords seo value
deeper we go more technical
good diagrams
founds any misatke or need improvement pleaese share
his sentence uses `$` delimiters to show math inline: $\sqrt{3x-1}+(1+x)^2$

Buffons Needle , a classical Geometrical Probability problem solved by Monte Carlo Simulation

$$
\begin{aligned}
P &= \frac{\int_0^{\pi/2} l \cos\theta \, d\theta}{\int_0^{\pi/2} t \, d\theta} \\
&= \frac{l}{t} \cdot \frac{\int_0^{\pi/2} \cos\theta \, d\theta}{\int_0^{\pi/2} d\theta} \\
&= \frac{l}{t} \cdot \frac{1}{\frac{\pi}{2}} \\
&= \frac{2l}{t\pi}.
\end{aligned}
$$



Considering needle length= distance between parallel lines i.e, _l_ = _t_


$$
P   = \frac{2}{\pi}
$$
