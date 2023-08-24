library(dplyr)
library(ggplot2)
# Creating Dataframes for steroid as well as controll group
names_vector <- c(
  'Larry Scott', 'Harold Poole', 'Earl Maynard', 'Chuck Sipes', 'Sergio Oliva',
  'Dave Draper', 'Arnold Schwarzenegger', 'Reg Lewis', 'Serge Nurbret', 'Frank Zane',
  'Franco Columbo', 'Lou Ferrigno', 'Robby Robinson', 'Ed Corney', 'Boyer Coe',
  'Ken Waller', 'Dennis Tinerino', 'Roy Callender', 'Kalman Szkalak', 'Danny Padilla',
  'Mike Menzer', 'Roger Walker', 'Chris Dickerson', 'Tom Platz', 'Jusop Wilkosz',
  'Casey Viator', 'Samir Bannout', 'Albert Beckles', 'Mohamed El Makkawy', 'Lee Haney',
  'Bertil Fox', 'Rich Gaspari', 'Mike Christian', 'Berry DeMey', 'Peter Hensel',
  'Lee Lebrada', 'Gary Strydom', 'Mike Quinn', 'Vince Taylor', 'Mohammed Benaziza',
  'Shawn Ray', 'Francis Benfatto', 'Dorian Yates', 'Sonny Schmidt', 'Kevin Levrone',
  'Flex Wheeler', 'Paul Dillett', 'Nasser El Sonbaty', 'Chris Cormier', 'Ronnie Coleman',
  'Lee Priest', 'Jay Cutler', 'Orville Burke', 'Günter Schlierkamp', 'Dexter Jackson',
  'Dennis James', 'Gustavo Badell', 'Markus Rühl', 'Victor Martinez', 'Melvin Anthony',
  'Dennis Wolf', 'Phil Heath', 'Toney Freeman', 'Branch Warren', 'Kai Greene',
  'Ronny Rockel', 'Shawn Rhoden', 'Mamdouh Elssbiay', 'William Bonac', 'Roelly Winklaar',
  'Brandon Curry', 'Steve Kuclo', 'Hadi Choopan', 'Hunter Labrada', 'Nicholas Walker',
  'Derek Lunsford', 'Samson Dauda', 'Flex Lewis', 'Sylvester Stallone', 'Dwayne johnson',
  'Jose Canseco', 'Mark McGwire', 'Barry Bonds', 'Alex Rodriguez', 'Ryan Braun',
  'Hulk Hogan', 'bill romanowski', 'Justin Gatlin', 'Dwain Chambers', 'Chris Benoit',
  'ken caminiti', 'Rafael Palmeiro', 'Brian Bosworth', 'Alistair Overeem', 'Vitor Belfort',
  'derson Silva', 'Brock Lesnar', 'Frank Mir', 'Royce Gracie', 'Stephan Bonnar',
  'Josh Barnett', 'eddie guerrero', 'Rich Piana', 'Dave Palumbo'
)

daughters <- c(
  1, NA, NA, 3, 1, NA, 2, NA, 1, 0, 1, 1, NA, NA, NA, NA, NA, NA, NA, NA, 
  NA, NA, NA, NA, NA, NA, 1, NA, NA, 2, 0, 0, NA, 1, NA, NA, 0, NA, NA, 0,
  2, NA, 1, NA, 0, 1, 0, 0, NA, 6, 1, 1, NA, NA, 1, 0, 2, 1, 4, NA, 0, 0,
  NA, 1, NA, 1, 1, 0, 1, 2, 1, NA, 1, 0, 0, 0, 0, 1, 3, 3, 1, 0, 2, 2, 1,
  1, 1, 0, 1, 1, 3, 0, 1, 3, 3, 2, 1, 1, 2, 0, 2, 2, 2, 3
)

sons <- c(
  4, NA, NA, 0, 2, NA, 3, NA, 2, 1, 0, 2, NA, NA, NA, NA, NA, NA, NA, NA, 
  NA, NA, NA, NA, NA, NA, 2, NA, NA, 1, 1, 0, NA, 0, NA, 2, 0, NA, NA, 0,
  0, NA, 1, NA, 1, 1, 0, 0, NA, 2, 0, 2, NA, NA, 0, 0, 2, 0, 2, NA, 0, 0,
  NA, 0, NA, 0, 0, 0, 2, 1, 3, NA, 1, 0, 0, 0, 0, 0, 2, 0, 0, 3, 1, 0, 2,
  1, 1, 2, 1, 2, 0, 2, 2, 0, 0, 3, 1, 2, 2, 1, 0, 0, 0, 1
)
roids_sex_ratio_df <- data.frame(names = names_vector, daughters = daughters, sons = sons)
roids_sex_ratio_df_1 <- roids_sex_ratio_df[-1]
roids_sex_ratio_df <- na.omit(roids_sex_ratio_df)


celebrities <- c("Brad Pitt", "David Beckham", "Will Smith", "Tom Cruise", 
                                "Johnny Depp", "Matt Damon", "Ben Affleck", "Hugh Jackman", 
                                "Robert Downey Jr.", "Chris Hemsworth", "Eddie Murphy", 
                                "Mel Gibson", "Jim Carrey", "Bruce Willis", "Clint Eastwood", 
                                "Daniel Craig", "George Clooney", "Jason Momoa", "Ryan Reynolds", 
                                "Justin Timberlake", "Ethan Hawke", "Jude Law", "Matthew McConaughey", 
                                "Tom Hanks", "Mark Wahlberg", "Nicolas Cage", "Michael Douglas", 
                                "Denzel Washington", "Orlando Bloom", "Ryan Ω", "Russell Crowe", 
                                "Kevin Costner", "Jamie Foxx", "Sean Connery", "Liam Neeson", 
                                "Steve Martin", "Ben Stiller", "Colin Farrell", "Heath Ledger", 
                                "Chris Pratt", "Alec Baldwin", "Owen Wilson", "Javier Bardem", 
                                "Jeff Goldblum", "Vin Diesel", "Robert De Niro", "Christian Bale", 
                                "Harrison Ford", "Ashton Kutcher", "Michael Bublé", "Sean Penn", 
                                "Al Pacino", "Adam Sandler", "Jack Black", "Idris Elba", "Bono (U2)", 
                                "Elton John", "Paul McCartney", "Lenny Kravitz", "Seal", "John Legend", 
                                "Mick Jagger")





daughters_cel <- c(3, 1, 1, 1, 1, 3, 2, 1, 1, 1, 5, 3, 1, 5, 4, 1, 1, 1, 3, 0, 2, 3, 1, 1, 2, 0, 1, 2, 1, 2, 2, 3, 2, 0, 0, 1, 1, 0, 1, 1, 5, 1, 1, 0, 1, 3, 1, 2, 1, 1, 1, 2, 2, 0, 1, 2, 0, 2, 1, 1, 1, 4)



sons_cel  <- c(3, 3, 2, 2, 1, 1, 1, 1, 2, 2, 5, 6, 0, 0, 3, 1, 1, 1, 0, 2, 2, 2, 2, 3, 2, 2, 1, 2, 1, 0, 0, 4, 0, 1, 2, 0, 1, 2, 0, 1, 2, 2, 1, 2, 2, 3, 1, 2, 1, 2, 1, 1, 0, 2, 1, 2, 2, 3, 0, 3, 2, 3)


celebrity_df <- data.frame(celebrities, daughters_cel, sons_cel)
celebrity_df_1 <- celebrity_df[-1]




#Bootstrapping 1000 new df for each group
n_iter <- 1000
n_rows_celeb <- nrow(celebrity_df_1)
n_rows_roid <- nrow(roids_sex_ratio_df_1)
bootstrap_dfs_celeb <- vector("list", n_iter)
bootstrap_dfs_roid <- vector("list", n_iter)
for(i in 1:n_iter) {
  bootstrap_dfs_celeb[[i]] <- sample_n(celebrity_df_1, size = n_rows_celeb, replace = TRUE)
  bootstrap_dfs_roid[[i]] <- sample_n(roids_sex_ratio_df_1, size = n_rows_roid, replace = TRUE)
}
sexratio_celeb <- c()
sexratio_roid <- c()
for(i in 1:1000) {
  sexratio_celeb[i] <- sum(bootstrap_dfs_celeb[[i]]$daughters_cel) / (sum(bootstrap_dfs_celeb[[i]]$daughters_cel) + sum(bootstrap_dfs_celeb[[i]]$sons_cel))
  sexratio_roid[i] <- sum(bootstrap_dfs_roid[[i]]$daughters) / (sum(bootstrap_dfs_roid[[i]]$daughters) + sum(bootstrap_dfs_roid[[i]]$sons))
}


data <- data.frame(
  Value = c(sexratio_roid, sexratio_celeb),
  Group = factor(rep(c("Roids", "Celeb"), each=length(sexratio_roid))) 
)

# Plotting the distribution of the bootstrapped mean values
ggplot(data, aes(x=Value, fill=Group)) +
  geom_density(alpha=0.6) +
  labs(title="Sex Ratio Distribution", x="Female offspring Share", y="density") +
  scale_fill_manual(values=c("Anabolic Steroid used"="green", "No Anabolic Steroids used "="purple")) +
  theme_minimal()


# Probability of getting any son
sum(roids_sex_ratio_df$sons >= 1)/nrow(roids_sex_ratio_df)
sum(celebrity_df$sons_cel >= 1)/nrow(celebrity_df)

roids_min_1son <- sum(roids_sex_ratio_df$sons >= 1)
roids_no_son <- nrow(roids_sex_ratio_df) - roids_min_1son

celeb_min_1son <- sum(celebrity_df$sons_cel >= 1)
celeb_no_son <- nrow(celebrity_df) - celeb_min_1son

prop.test(c(roids_min_1son, celeb_min_1son),
          c(nrow(roids_sex_ratio_df), nrow(celebrity_df)),
          alternative = "less")

