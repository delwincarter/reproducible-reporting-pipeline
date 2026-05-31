# 01_data_cleaning.R
# Enterprise Pipeline Stage 1: Data Ingestion & Automated Integrity Auditing
library(dplyr)
library(tidyr)

generate_raw_enterprise_data <- function(n_records = 5000) {
  set.seed(42)
  data.frame(
    user_id = 1000:(1000 + n_records - 1),
    segment = sample(c("Enterprise", "Mid-Market", "SMB", NA), n_records, replace = TRUE, prob = c(0.3, 0.4, 0.2, 0.1)),
    baseline_engagement = rnorm(n_records, mean = 50, sd = 10),
    q1_activity = rnorm(n_records, mean = 55, sd = 12),
    q2_activity = rnorm(n_records, mean = 48, sd = 15)
  )
}

audit_and_clean_pipeline <- function(raw_data) {
  # Programmatic validation: Isolate structural noise and missing values
  cleaned_data <- raw_data %>%
    filter(!is.na(segment)) %>%
    mutate(
      segment = as.factor(segment),
      # Structural anomaly handling: Cap extreme processing errors
      q2_activity = ifelse(q2_activity < 0, 0, q2_activity),
      variance_delta = q2_activity - q1_activity
    )
  return(cleaned_data)
}

# Execute Ingestion
raw_db <- generate_raw_enterprise_data()
clean_metrics <- audit_and_clean_pipeline(raw_db)