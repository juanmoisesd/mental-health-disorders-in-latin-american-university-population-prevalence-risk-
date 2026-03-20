# analysis.R — Mental Health Disorders in Latin American University Population: Prevalence, Risk Factors and Protective Variables — Statistical Database
# DOI: 10.5281/zenodo.18984594
# Author: de la Serna Tuya, Juan Moisés · ORCID: 0000-0002-8401-8018
# License: CC0 1.0

# ── SETUP ──────────────────────────────────────────────────────────────────
# Install required packages if needed:
# install.packages(c("readr","ggplot2","dplyr","tidyr"))

library(readr)
library(ggplot2)
library(dplyr)

# ── LOAD DATA ──────────────────────────────────────────────────────────────
# Download dataset from: https://doi.org/10.5281/zenodo.18984594
# df <- read_csv("dataset.csv")

# Example with synthetic data
set.seed(42)
years <- 2000:2023
df <- data.frame(
  year = years,
    mental_healt = rnorm(length(years), 50, 15),
  university_s = rnorm(length(years), 50, 15),
  latin_americ = rnorm(length(years), 50, 15),
  depression = rnorm(length(years), 50, 15),
  stringsAsFactors = FALSE
)

cat("Dataset: Mental Health Disorders in Latin American Universi\n")
cat("DOI: 10.5281/zenodo.18984594\n")
cat("Dimensions:", nrow(df), "x", ncol(df), "\n\n")
print(head(df))
print(summary(df))

# ── VISUALIZATION ──────────────────────────────────────────────────────────
# Temporal trend
p1 <- df %>%
  tidyr::pivot_longer(-year, names_to="variable", values_to="value") %>%
  ggplot(aes(x=year, y=value, color=variable)) +
  geom_line(size=0.8) +
  geom_point(size=1.5) +
  labs(title="Mental Health Disorders in Latin American University Po",
       subtitle="DOI: 10.5281/zenodo.18984594",
       x="Year", y="Value",
       caption="de la Serna Tuya, Juan Moisés · 2026") +
  theme_minimal() +
  theme(legend.position="bottom")

ggsave("figures/analysis_output_r.png", p1, width=10, height=6, dpi=150)
cat("\nFigure saved: figures/analysis_output_r.png\n")

# ── CITATION ───────────────────────────────────────────────────────────────
cat("\nCitation:\n")
cat("de la Serna Tuya, Juan Moisés (2026). Mental Health Disorders in Latin American University Population: Preva. Zenodo. https://doi.org/10.5281/zenodo.18984594\n")
