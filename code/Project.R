library(ggplot2)

musicData <- read.csv(file = "C:\\Users\\hanna\\Desktop\\F22\\Data Visualization\\tcc_ceds_music.csv")
head(musicData)

#ed_exp3 <- education[which(education$Region == 2),names(education) %in% c("State","Minor.Population","Education.Expenditures")]

popData <- musicData[which(musicData$genre == "pop"), names(musicData) %in% c("release_date", "len", "dating", "violence", "world.life", 
                                                                            "night.time","romantic", "obscene", "family.spiritual", "danceability", 
                                                                             "sadness", "instrumentalness", "topic"
                                                                            )]
head(popData)
ggplot(data = popData) + geom_smooth(mapping = aes(x = release_date, y = obscene)) + geom_point(mapping = aes(x = release_date, y = obscene), alpha = 1/5)
ggplot(data = popData) + geom_smooth(mapping = aes(x = release_date, y = family.spiritual))
