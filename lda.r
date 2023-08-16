# Load necessary libraries
library(MASS)
library(ggplot2)

# Load the mtcars dataset
data(mtcars)
X <- mtcars[, c("mpg", "disp", "hp", "wt", "qsec")]

# Perform LDA
lda_model <- lda(X, mtcars$am)

# Transform the data to the lower-dimensional space
X_lda <- predict(lda_model, X)$x

# Create a histogram for each class in the transformed space
ggplot(data = data.frame(X_lda, Class = factor(mtcars$am)),
       aes(x = LD1, fill = Class)) +
  geom_histogram(binwidth = 0.5, position = "identity", alpha = 0.5) +
  facet_grid(. ~ Class) +
  labs(title = "Histograms of LDA Transformed Data by Class",
       x = "LD1", y = "Frequency")
