# rmarkdown::render('../dcnrota/published_rota.Rmd')

x %>% color_rota(specific_start_date = today()-7,
                 publish_until = dmy('17082025'),
                 weeks_ahead = 30) %>%
  scroll_box(width = "100%", height = "500px") %>%
  save_kable(file = "../dcnrota/published_rota.html", self_contained = T)

#browseURL("../dcnrota/published_rota.html")
#%>% scroll_box(width = "100%", height = "1000px")

library(usethis)
system("./encrypt.sh")
git_comment = glue::glue("update rota {lubridate::today()}")
system('git add --all')
system(glue::glue('git commit -m "{git_comment}"'))
system('git push origin master')
#browseURL('https://github.com/acousticus/dcnspr.git')
#browseURL('https://acousticus.github.io/dcnspr')
