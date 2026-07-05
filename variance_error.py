import numpy as np
import matplotlib.pyplot as plt

def estimate_pi(n_runs):

    n_hits = 0

    for i in range(n_runs):

        x1 = 10*np.random.rand() + 1
        y1 = 10*np.random.rand() + 1

        theta = 2*np.pi*np.random.rand()

        x2 = x1 + np.cos(theta)
        y2 = y1 + np.sin(theta)

        if np.ceil(min(y1, y2)) == np.floor(max(y1, y2)):

            n_hits += 1

    prob = n_hits / n_runs
    estimated_pi = 2 / prob
 
    return estimated_pi
n_experiments = 50

pi_estimates = []
n_runs=500
for i in range(n_experiments):
    pi_estimates.append(estimate_pi(n_runs))

pi_estimates = np.array(pi_estimates)

mean_pi = np.mean(pi_estimates)

variance_pi = np.var(pi_estimates, ddof=1)   # Sample variance

std_pi = np.std(pi_estimates, ddof=1)
true_pi = np.pi

errors = np.abs(pi_estimates - true_pi)

mean_error = np.mean(errors)# Mean Absolute Error


print("  Mean Estimate :", mean_pi)
print("  Variance      :", variance_pi)
print("  Std Deviation :", std_pi)
print("  Mean Absolute Error :", mean_error)

plt.figure(figsize=(8,2))

plt.scatter(pi_estimates,
            np.ones(len(pi_estimates)),
            s=50)

plt.axvline(np.pi,
            color='red',
            linestyle='--',
            label='Actual π')

plt.yticks([])
plt.xlabel("Estimated π")
plt.title("Variance Analysis of Estimates of π")
plt.legend()

plt.show()
