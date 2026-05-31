# ==============================================================================
# 02_statistical_modeling.R
# Enterprise Pipeline Stage 2: Statistical Modeling & Visual Diagnostics
# ==============================================================================
library(dplyr)
library(ggplot2)

analyze_behavioral_transitions <- function(cleaned_data) {
  # Isolating transitions and variance shifts across distinct enterprise tiers
  transition_matrix <- cleaned_data %>%
    group_by(segment) %>%
    summarise(
      Mean_Baseline = mean(baseline_engagement, na.rm = TRUE),
      Mean_Q1_State = mean(q1_activity, na.rm = TRUE),
      Mean_Q2_State = mean(q2_activity, na.rm = TRUE),
      Volatility_Index = sd(variance_delta, na.rm = TRUE),
      .groups = "drop"
    )
  return(transition_matrix)
}

# 1. Execute Core Analysis
model_output <- analyze_behavioral_transitions(clean_metrics)

# 2. Generate Standalone Visual Asset for Repository Documentation
message("Generating independent visual diagnostic assets...")

corporate_plot <- ggplot(clean_metrics, aes(x = segment, y = variance_delta, fill = segment)) +
  geom_boxplot(alpha = 0.7, outlier.colour = "#c0392b", outlier.shape = 16) +
  scale_fill_manual(values = c("Enterprise" = "#2c3e50", "Mid-Market" = "#2980b9", "SMB" = "#7f8c8d")) +
  theme_minimal(base_size = 12) +
  labs(
    title = "Structural Performance Shifts by Customer Segment",
    subtitle = "Automated Quality Assurance Pipeline Target Analytics",
    x = "Enterprise Operational Tier",
    y = "Longitudinal Variance Delta (Q2 - Q1)",
    fill = "Segment"
  ) +
  theme(
    plot.title = element_text(face = "bold", color = "#2c3e50"),
    legend.position = "none"
  )

# 3. Force-write the asset to the root working directory
ggsave(
  filename = "structural_drift_analysis.png", 
  plot = corporate_plot, 
  width = 8, 
  height = 5, 
  dpi = 300
)

message("[SUCCESS] Standalone visual diagnostic exported: 'structural_drift_analysis.png'")