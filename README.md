
# Estimating $\pi$ using Buffon's needle- A Monte Carlo Simulation
## Introduction:
~ Buffons Needle , a classical _Geometrical Probability_ problem solved by **Monte Carlo Simulation**
This method in which drop needles on parallel lines is one of the first Monte Carlo methods for estimating $\pi$ .
Infact Buffon's needle was one of the earliest problems in geometric probability to be solved.

The formula after simplifications and assumptions comes down to

$$
P   = \frac{2}{\pi}
$$ 

where P is the final probability that a needle randomly dropped onto a surface will land across one of the parallel lines

**Let me go through you a small derivation for deeper understanding of method** 
<img width="402" height="358" alt="buffon ggl" src="https://github.com/user-attachments/assets/c6e4f2f7-4e82-4c22-856f-453220d97676" />

There's a plane containing parallel lines or strips with width _t_ , the needle we're gonna drop have a length _l_ and P is the final probability we need to calculate
 


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

# Estimation of $\pi$ : Finding probability
<img width="2000" height="2000" alt="Black and White Bold Typographic Music Studio Logo copy222" src="https://github.com/user-attachments/assets/057ae142-8cd2-4955-bbef-f489d9d0ddb8" />

## Algorithmic approach through Code:

(1) Find the min and max y coordinates of the needle 

(2) Apply ceil to min y coordinate, ceil(min(y1, y2))

(3) Apply floor to max y coordinate, floor(min(y1, y2))

(4) If the result from 2 and 3 are not equal, needle does not intersect with lines

(5) If the result from 2 and 3 are equal, needle intersect with line

# Variance and Error Analysis:
