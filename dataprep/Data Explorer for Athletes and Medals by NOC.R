library(readxl)

df <- read_excel("C://Users//evely//Documents//Miami Stuff//Semester 8//ISA 401//Final Project//Only Things Needed for Viz (1).xlsx", sheet = "All")

df$id <- as.factor(df$id)
df$age <-as.numeric(df$age)
df$height<-as.numeric(df$height)
df$weight<-as.numeric(df$weight)

df <- df[ -c(18:20) ]

summary(df)

library(DataExplorer)
introduce(df)

plot_intro(df)
plot_missing(df)

plot_bar(df, by = "sex")

plot_histogram(df)

