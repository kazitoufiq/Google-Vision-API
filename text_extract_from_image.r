devtools::install_github("cloudyr/RoogleVision")
library(devtools)
install_github("cloudyr/RoogleVision")
library(RoogleVision)


options("googleAuthR.client_id" = "xxxxxx.apps.googleusercontent.com")
options("googleAuthR.client_secret" = "yyyyyyy")

options("googleAuthR.scopes.selected" = c("https://www.googleapis.com/auth/cloud-platform"))
googleAuthR::gar_auth()


fl <- list.files(path = ".", pattern = ".png", ignore.case = T)


for(i in 1:length(fl) ){
  
  label <- getGoogleVisionResponse(fl[i],feature = 'TEXT_DETECTION')
  write(label$description[1], paste0(fl[i],".txt"))
  
  
}
