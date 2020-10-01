options(warn=-1)
library(tm)
library(tidytext)
library(ggplot2)
library(dplyr)

blogs <- file("en_US.blogs.txt")
blogs_lines <- readLines(blogs, n=899288, encoding='UTF-8')
close(blogs)

text_b <- tibble(line = 1:899288, text=blogs_lines)

n_words <- text_b %>% 
    unnest_tokens(word,text) %>% 
    count(word,sort = TRUE)

ggplot(data = n_words[1:12,], aes(x = reorder(word,n), y =n))+
    geom_col(stat = "identity")+
    xlab(NULL) + coord_flip()
