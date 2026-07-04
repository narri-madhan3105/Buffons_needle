# Buffons_needle
## contents
## introduction
keywords seo value
deeper we go more technical
good diagrams
founds any misatke or need improvement pleaese share
his sentence uses `$` delimiters to show math inline: $\sqrt{3x-1}+(1+x)^2$

Buffons Needle , a classical Geometrical Probability problem solved by Monte Carlo Simulation

$$
\begin{aligned}
P1 &= \frac{\int_0^{\pi/2} l \cos\theta \, d\theta}{\int_0^{\pi/2} t \, d\theta} \\
&= \frac{l}{t} \cdot \frac{\int_0^{\pi/2} \cos\theta \, d\theta}{\int_0^{\pi/2} d\theta} \\
&= \frac{l}{t} \cdot \frac{1}{\frac{\pi}{2}} \\
&= \frac{2l}{t\pi}.
\end{aligned}
$$

$$
\begin{align}
P_2 &= \int_0^1 \frac{2\theta(x)}{\pi} \, dx \\
&= \frac{2}{\pi} \int_0^1 \cos^{-1}(x) \, dx \\
&= \frac{2}{\pi} \cdot 1 = \frac{2}{\pi}.
\end{align}
$$

Multiplying both results, we obtain $P = P_1 \cdot P_2 = \frac{l}{t} \cdot \frac{2}{\pi} = \frac{2l}{t\pi}$ as above.

$$
P = P_1 \cdot P_2 = 1 \cdot \frac{2}{\pi} = \frac{2}{\pi}
$$
