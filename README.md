
# Estimating $\pi$ using Buffon's needle- A Monte Carlo Simulation
## Introduction:
~ Buffon's Needle , a classic _Geometrical Probability_ problem solved by **Monte Carlo Simulation**
This method in which drop needles on parallel lines is one of the first Monte Carlo methods for estimating $\pi$ .
Infact Buffon's needle was one of the earliest problems in geometric probability to be solved.

The formula after simplifications and assumptions comes down to

$$
**P   = \frac{2}{\pi}**
$$ 

where P is the final probability that a needle randomly dropped onto a surface will land across one of the parallel lines.
The formula relates the physical probability of a needle crossing a line to the geometric value of $\pi$, showing how random straight line drops can naturally uncover the curvature of a circle

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
<img width="2000" height="2000" alt="Black and White Bold Typographic Music Studio Logo 333" src="https://github.com/user-attachments/assets/94389ca3-e47e-470b-8c03-3c4a14384a9f" />


## Algorithmic approach through Code:
We're gonna drop needles using the parametric equation of a Line

-> **x₂ = x₁ + _l_ cos(θ)**

-> **y₂ = y₁ + _l_ sin(θ)**

(1) Find the min and max y coordinates of the needle 

(2) Apply ceil to min y coordinate, ceil(min(y1, y2))

(3) Apply floor to max y coordinate, floor(min(y1, y2))

(4) If the result from 2 and 3 are not equal, needle does not intersect with lines

(5) If the result from 2 and 3 are equal, needle intersect with line

# Variance and Error Analysis:

**The question which we need to discuss in Variance analysis is how consistent are repeated Monte Carlo estimates**
The repeated simulations produced different estimates of π that were closely clustered around the true value. The low sample variance indicates that the Monte Carlo estimator exhibits low variability.., suggesting that on repetitions of the experiment it yields consistent estimates.

  <img width="278" height="100" alt="Screenshot 2026-07-04 123622" src="https://github.com/user-attachments/assets/09e6614a-91c1-44c7-888a-8da01eaed24a" />

we note all the pi estimates we got through repition of the simualtion over a large no of times then we calculate the Mean $\pi$ estimate , variance , error....

To calculate the Average $\pi$ estimate we will use $\[
\bar{\pi}=\frac{\pi_1+\pi_2+\cdots+\pi_n}{n}
\]$

$\text{Absolute Error} = \left| \hat{\pi} - \pi \right|$

<img width="640" height="315" alt="variance analysis" src="https://github.com/user-attachments/assets/7580f6f1-16a5-4088-8ae2-3a65321d23d1" />

The sample variance of the Monte Carlo estimates was 0.00123, indicating a very low variability... This observation is consistent with the narrow spread observed in our box plot

To conclude, the variance analysis demonstrates that while individual Monte Carlo simulations produce slightly different estimates because of nature of randomness, the variability of these estimates remains small and many times negligible. This indicates that the Buffon's Needle method is reliable for a given  simulation size. **Larger simulations produce more consistent estimates.Also the error generally decreases as the number of simulations increases**.

# Convergence plot - Tha Law of Large Numbers:
The formal definition of the law of large numbers states that as the number of independent, identically distributed random variables increases, their sample mean converges to the true and expected value of the distribution

In my words i say _Randomness on a large repetition leads to Certainity_ , which is quite fascinating  coz we are figuring out the probabilities of uncertain random stuff with the help of numerous repetitions  
**Randomness + Repetition = Highly certain Probability** . Intuitionly Chaos at the micro-level becomes order at the macro-level.

Convergence plot  shows how the estimator approaches π as the number of needle drops increases
<img width="775" height="887" alt="buffons_graph" src="https://github.com/user-attachments/assets/737e3b62-08cd-4be1-baa5-5c5e34ffb560" />

Our Convergence graph explains the convergence of the Monte Carlo estimate of π as the number of needle drops increases. At small sample sizes the estimate exhibits large fluctuations due to variation in sample size. As more and more simulations are performed the estimator  converges toward the true value of π. This behavior is consistent with the Law of Large Numbers, which states that sample based estimators become increasingly accurate as the number of observations increases

# Discussion on Time Complexity of the Simulation:
Suppose there are N needles:

One iteration → O(1)

N iterations → O(N)

Runtime ∝ number of Needles

**Time Complexity**

Worst Case: O(N)

Average Case: O(N)

Best Case: O(N)

since every needle must be dropped to calcute the required probability

## How to tweak this project for your own uses

Since this is an example project, I'd encourage you to clone and rename this project to use for your own purposes. It's a good starter

## Contribution

Contributions are welcome!

If you discover a bug, identify an optimization, or have suggestions for improving the simulation or analysis, feel free to open an issue or submit a Pull Request.

Feedback and enhancements are greatly appreciated.

## Credits

**Author:** Madhan Kumar

This project was developed to explore Monte Carlo methods through Buffon's Needle experiment, with additional statistical analyses including convergence, variance, error, and computational performance.

Special acknowledgement to:

- Georges-Louis Leclerc, Comte de Buffon, for the original Buffon's Needle problem.
- https://github.com/KannamSridharKumar
- https://github.com/PuspenduPH
## License

This project is shared for educational purposes. Feel free to use, modify, and distribute the code for personal or academic use without requiring explicit permission.

## Reference Links :
https://en.wikipedia.org/wiki/Buffon's_needle_problem

https://www.ventrella.com/Buffon/index.html

