library(tidyverse)
library(VennDiagram)

df <- read.csv("participation.csv") 
pretest <- c(df$pretest) 
pretest <- pretest[!is.na(pretest)]

posttest <- c(df$posttest) 
posttest <- posttest[!is.na(posttest)]

modules <- unique(c(df$module1, df$module2, df$module3, df$module4))
modules <- modules[!is.na(modules)]


df2 <- list(
  A = pretest, 
  B = posttest, 
  C = modules
)

venn.diagram(
  x = list(pretest, posttest, modules),
  category.names = c("Pre-Training Survey" , "Post-Training Survey ", "Post-Module Surveys"),
  filename = 'manuscript/figures/participation.png',
  output=TRUE,
  height = 500 , 
  width = 500 , 
  resolution = 300,
  lwd = 1,
  col=c("#440154ff", '#21908dff', '#fde725ff'),
  fill = c(alpha("#440154ff",0.3), alpha('#21908dff',0.3), alpha('#fde725ff',0.3)),
  cex = 0.5,
  fontfamily = "sans",
  cat.cex = 0.5,
  cat.default.pos = "outer",
  cat.pos = c(-18, 18, 180),
  #cat.dist = c(0.055, 0.055, 0.085),
  cat.fontfamily = "sans",
  cat.col = c("#440154ff", '#21908dff', '#fde725ff'),
  rotation = 3
)


#############################################################################
classification <- data.frame(classification = c("First-Year", "Sophomore", "Junior", "Senior", "Masters Student", "Doctoral Student", "Other"),
                             n = c(5, 6, 8, 13, 16, 18, 2)) %>% 
  mutate(classification = fct_relevel(classification, "First-Year", "Sophomore", "Junior", "Senior", "Masters Student", "Doctoral Student", "Other"))

classification %>% 
  ggplot() +
  geom_col(aes(x = classification, y = n), fill = "grey", color = "black") +
  geom_text(aes(label = n, x = classification, y = n), vjust = -0.5) +
  xlab("Classification") +
  ylab("Number of Participants") +
  scale_y_continuous(limits = c(0, 20)) +
  theme_classic() +
  theme(axis.text.y = element_text(size = 12, color = "black"),
        axis.text.x = element_text(size = 12, color = "black", angle = 90, vjust = 1, hjust = 1),
        axis.title = element_text(size = 12, color = "black"))
# 300 x 400

school <- data.frame(school = c("Lincoln", "Omaha", "Kearney", "Other"),
                             n = c(48, 6, 12, 2)) %>% 
  mutate(school = fct_relevel(school, "Lincoln", "Omaha", "Kearney", "Other"))

school %>% 
  ggplot() +
  geom_col(aes(x = school, y = n), fill = "grey", color = "black") +
  geom_text(aes(label = n, x = school, y = n), vjust = -0.5) +
  xlab("University of Nebraska Campus") +
  ylab("Number of Participants") +
  scale_y_continuous(limits = c(0, 55)) +
  theme_classic() +
  theme(axis.text.y = element_text(size = 12, color = "black"),
        axis.text.x = element_text(size = 12, color = "black", angle = 90, vjust = 1, hjust = 1),
        axis.title = element_text(size = 12, color = "black"))

race <- data.frame(race = c("Asian", "Black or African American", "Hispanic, Latino, or Spanish origin", "Middle Eastern or North African", "White", "Other race, ethnicity, or origin", "2+ Races"),
                     n = c(7, 3, 4, 1, 47, 1, 5)) %>% 
  mutate(race = fct_relevel(race, "Asian", "Black or African American", "Hispanic, Latino, or Spanish origin", "Middle Eastern or North African", "White", "Other race, ethnicity, or origin", "2+ Races"))

race %>% 
  ggplot() +
  geom_col(aes(x = race, y = n), fill = "grey", color = "black") +
  geom_text(aes(label = n, x = race, y = n), vjust = -0.5) +
  xlab("Race") +
  ylab("Number of Participants") +
  scale_y_continuous(limits = c(0, 50)) +
  theme_classic() +
  theme(axis.text.y = element_text(size = 12, color = "black"),
        axis.text.x = element_text(size = 12, color = "black", angle = 90, vjust = 1, hjust = 1),
        axis.title = element_text(size = 12, color = "black"))

birth <- data.frame(birth = c(1955, 1979, 1982, 1983, 1985, 1986, 1987,
                              1990, 1991, 1991, 1991, 1992, 1992, 1992,
                              1993, 1993, 1993, 1994, 1994, 1994, 1995,
                              1995, 1995, 1996, 1996, 1996, 1996, 1996,
                              1996, 1996, 1997, 1997, 1997, 1997, 1998,
                              1998, 1998, 1998, 1998, 1999, 1999, 2000,
                              2000, 2000, 2000, 2000, 2000, 2001, 2001,
                              2001, 2001, 2001, 2001, 2001, 2001, 2002,
                              2002, 2002, 2002, 2002, 2002,  2003, 2003,
                              2003, 2003, 2003, 2004, 2004, 2004))

birth %>% 
  ggplot() +
  geom_bar(aes(x = birth), fill = "grey", color = "black", stat = "count") +
  xlab("Birth Year") +
  ylab("Number of Participants") +
  theme_classic() +
  theme(axis.text.y = element_text(size = 12, color = "black"),
        axis.text.x = element_text(size = 12, color = "black"),
        axis.title = element_text(size = 12, color = "black"))

first_gen <- data.frame(first_gen = c("Yes", "No"),
                   n = c(23, 45)) %>% 
  mutate(first_gen = fct_relevel(first_gen, "Yes", "No"))

first_gen %>% 
  ggplot() +
  geom_col(aes(x = first_gen, y = n), fill = "grey", color = "black") +
  geom_text(aes(label = n, x = first_gen, y = n), vjust = -0.5) +
  xlab("First-Generation") +
  ylab("Number of Participants") +
  scale_y_continuous(limits = c(0, 50)) +
  theme_classic() +
  theme(axis.text.y = element_text(size = 12, color = "black"),
        axis.text.x = element_text(size = 12, color = "black"),
        axis.title = element_text(size = 12, color = "black"))

gender <- data.frame(gender = c("Non-Binary/Third Gender", "Female", "Male", "Prefer Not to Answer"),
                        n = c(3, 46, 18, 1)) %>% 
  mutate(gender = fct_relevel(gender, "Non-Binary/Third Gender", "Female", "Male", "Prefer Not to Answer"))

gender %>% 
  ggplot() +
  geom_col(aes(x = gender, y = n), fill = "grey", color = "black") +
  geom_text(aes(label = n, x = gender, y = n), vjust = -0.5) +
  xlab("Gender") +
  ylab("Number of Participants") +
  scale_y_continuous(limits = c(0, 52)) +
  theme_classic() +
  theme(axis.text.y = element_text(size = 12, color = "black"),
        axis.text.x = element_text(size = 12, color = "black", angle = 90, hjust = 1, vjust = 1),
        axis.title = element_text(size = 12, color = "black"))
         