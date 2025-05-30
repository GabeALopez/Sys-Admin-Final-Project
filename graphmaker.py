import matplotlib.pyplot as plt

# Percentiles and corresponding response times (in milliseconds) from the image
percentiles = [50, 66, 75, 80, 90, 95, 98, 99, 100]
response_times = [402, 462, 502, 528, 656, 867, 983, 1083, 1276]

# Plotting the percentile graph
plt.figure(figsize=(10, 6))
plt.plot(percentiles, response_times, marker='o', linestyle='-', color='blue')
plt.title("Response Time Percentiles")
plt.xlabel("Percentile (%)")
plt.ylabel("Response Time (ms)")
plt.grid(True)
plt.tight_layout()

# Save the figure
output_path = "/mnt/data/response_time_percentiles.png"
plt.savefig(output_path)

output_path
