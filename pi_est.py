import numpy as np
import matplotlib.pyplot as plt

# Note : Uncomment if you're using Jupyter notebook
# %matplotlib inline

plt.style.use("dark_background")

# ---------------- Parameters ----------------

n_runs = 400
needle_length = 1

n_hits = 0

xi = []
yi = []
xj = []
yj = []
hits = []

# ---------------- Simulation ----------------

for _ in range(n_runs):

    # Random starting point
    x1 = 10 * np.random.rand() + 1
    y1 = 10 * np.random.rand() + 1

    # Random angle
    theta = 2 * np.pi * np.random.rand()

    # Second endpoint
    x2 = x1 + needle_length * np.cos(theta)
    y2 = y1 + needle_length * np.sin(theta)

    # Check for intersection
    if np.ceil(min(y1, y2)) == np.floor(max(y1, y2)):
            n_hits += 1
            hits.append(True)
    else:
         hits.append(False)


    xi.append(x1)
    yi.append(y1)
    xj.append(x2)
    yj.append(y2)
    

# ---------------- Results ----------------

prob = n_hits / n_runs
pi_est = 2 / prob

print(f"Total Needles      : {n_runs}")
print(f"Intersections      : {n_hits}")
print(f"Probability        : {prob:.5f}")
print(f"Estimated π        : {pi_est:.6f}")
print(f"Actual π           : {np.pi:.6f}")

# ---------------- Plot ----------------

fig, ax = plt.subplots(figsize=(9,9))

ax.set_facecolor("#101010")

# Horizontal lines
for y in range(1,12):
    ax.axhline(y,
               color="white",
               linewidth=2)

# Draw needles
for i in range(n_runs):

    if hits[i]:
        needle_color = "red"
    else:
        needle_color = "cyan"

    # Shadow (gives depth)
    ax.plot([xi[i], xj[i]],
            [yi[i], yj[i]],
            color="black",
            linewidth=4.2,
            alpha=0.45,
            solid_capstyle="round")

    # Metallic body
    ax.plot([xi[i], xj[i]],
            [yi[i], yj[i]],
            color=needle_color,
            linewidth=2.8,
            solid_capstyle="round")

    # Needle eye
    ax.scatter(xi[i],
           yi[i],
           s=22,
           color=needle_color,
           edgecolors="black",
           linewidths=0.2,
           zorder=3)

    # Needle tip
    ax.scatter(xj[i],
               yj[i],
               s=10,
               color=needle_color,
               zorder=3)

# Axis settings
ax.set_xlim(0,12)
ax.set_ylim(0,12)

ax.set_xticks(range(13))
ax.set_yticks(range(13))

ax.grid(True,
        linestyle="--",
        alpha=0.20)

# Remove extra borders
ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)

# Title
ax.set_title("Buffon's Needle Simulation",
             fontsize=18,
             fontweight="bold",
             pad=15,
             fontname="Georgia")

# Pi estimate box
ax.text(0.4,
        11.35,
        f"Estimated π = {pi_est:.5f}",
        fontsize=13,
        color="yellow",
        bbox=dict(facecolor="black",
                  edgecolor="yellow",
                  alpha=0.85))

plt.show()
