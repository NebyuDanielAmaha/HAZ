library(haven)
library(ggplot2)
library(gridExtra)
library(tidyverse)

df <- read_dta("ETKR81FL.dta")

# Create individual plots for each variable
create_plot <- function(x_var, title, x_label) {
  ggplot(df, aes(x = {{x_var}}, y = haz)) + 
    geom_smooth(method = "loess", color = "blue", se = TRUE, fill = "grey", alpha = 0.5, size = 1) + 
    labs(title = title, x = x_label, y = "HAZ") +
    theme_minimal() +
    theme(
      plot.title = element_text(size = 12, hjust = 0.5, face = "bold"), # Increased font size for clarity
      axis.text = element_text(size = 10),
      axis.title = element_text(size = 11),
      panel.grid.major = element_line(size = 0.5, linetype = "dotted", color = "grey"), # Soft gridlines
      panel.grid.minor = element_blank()
    )
}

# Generate plots
plot1 <- create_plot(v133, "A", "Maternal education in years")
plot2 <- create_plot(v012, "B", "Mother's age in years")
plot3 <- create_plot(hw1, "C", "Child age in months")
plot4 <- create_plot(v040, "D", "Altitude in meters")

# Arrange plots in a 2x2 grid


grid.arrange(plot1, plot2, plot3, plot4, ncol = 2)
