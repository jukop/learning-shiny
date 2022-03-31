simulate_data_old <- function(opnro) {
  set.seed(opnro)
  # Diskreetti tasajakauma l??ytyy purrr-paketin funktiosta rdunif
  require(purrr)
  nsim = 30
  
  #r:			tasajakautunut kokonaisluku 0-n, n on toinen argumentti funktiossa random
  #Vyötärö:		vyota, on diskreetti tasajakauma 64-94
  vyota = rdunif(n=nsim,a=64,b=94)
  vyota
  
  #Paino:			paino = 25.7 + (0.739 * vyota) + (r – 1); korkeintaan 99
  r = rdunif(n=nsim,a=0,b=4)
  paino = 25.7 + (0.739 * vyota) + (r-1)
  paino
  
  #Pituus:			pituus = 140.8 + (1.084 * paino) - (.72 * vyota) + (r - 4);
  r = rdunif(n=nsim,a=0,b=16)
  pituus = 140.8 + (1.084 * paino) - (.72 * vyota) + (r-4)
  pituus
  #Hatun koko:		hattu = 32.8 + (.189 * vyota) + (.112 * paino) + (r - 1);
  r = rdunif(n=nsim,a=0,b=1)
  hattu = 32.8 + (.189 * vyota) + (.112 * paino) + (r-1);
  hattu
  #Kaulus:		kaulus = 38.2 + (.227 * vyota) + (.05 * paino) + (r - 1);
  r = rdunif(n=nsim,a=0,b=3)
  kaulus = 38.2 + (.227 * vyota) + (.05 * paino) + (r-1)
  kaulus
  
  #Hihan pituus:		hiha = -58.9 + (.668 * pituus) + (r - 1);
  r = rdunif(n=nsim,a=0,b=4)
  hiha = -58.9 + (.668 * pituus) + (r-1)
  hiha
  
  #Lahkeen pituus:	lahje = -21.25 + (.584 * pituus) + (r - 1);
  r = rdunif(n=nsim,a=0,b=4)
  lahje = -21.25 + (.584 * pituus) + (r-1)
  
  #Kengän koko:		kenka = 30 - (.028 * pituus) + (.028 * vyota) + (.17 * paino) + (r - 2);
  r = rdunif(n=nsim,a=0,b=5)
  kenka = 30 - (.028 * pituus) + (.028 * vyota) + (.17 * paino) + (r-2)
  kenka
  
  #Työpaikka (0 = Ulkotyö,1 = Sisätyö)
  tyo = rdunif(n=nsim,a=0,b=1)
  #Sukupuoli(0 = mies tai 1 = nainen)
  sukup = rdunif(n=nsim,a=0,b=1)
  
  dat <- data.frame(vyota,paino,pituus,hattu,kaulus,hiha,lahje,kenka)
  dat
}

simulate_data <- function(opnro) {
  set.seed(opnro)
  # Diskreetti tasajakauma l??ytyy purrr-paketin funktiosta rdunif
  # käytetään sen sijasta runif-funktiota ja pyöristämistä
  nsim = 30
  
  #r:			tasajakautunut kokonaisluku 0-n, n on toinen argumentti funktiossa random
  #Vyötärö:		vyota, on diskreetti tasajakauma 64-94
  vyota = runif(n=nsim,min=64,max=94)
  vyota
  
  #Paino:			paino = 25.7 + (0.739 * vyota) + (r – 1); korkeintaan 99
  r = runif(n=nsim,min=0,max=4)
  paino = 25.7 + (0.739 * vyota) + (r-1)
  paino
  
  #Pituus:			pituus = 140.8 + (1.084 * paino) - (.72 * vyota) + (r - 4);
  r = runif(n=nsim,min=0,max=16)
  pituus = 140.8 + (1.084 * paino) - (.72 * vyota) + (r-4)
  pituus
  #Hatun koko:		hattu = 32.8 + (.189 * vyota) + (.112 * paino) + (r - 1);
  r = runif(n=nsim,min=0,max=1)
  hattu = 32.8 + (.189 * vyota) + (.112 * paino) + (r-1);
  hattu
  #Kaulus:		kaulus = 38.2 + (.227 * vyota) + (.05 * paino) + (r - 1);
  r = runif(n=nsim,min=0,max=3)
  kaulus = 38.2 + (.227 * vyota) + (.05 * paino) + (r-1)
  kaulus
  
  #Hihan pituus:		hiha = -58.9 + (.668 * pituus) + (r - 1);
  r = runif(n=nsim,min=0,max=4)
  hiha = -58.9 + (.668 * pituus) + (r-1)
  hiha
  
  #Lahkeen pituus:	lahje = -21.25 + (.584 * pituus) + (r - 1);
  r = runif(n=nsim,min=0,max=4)
  lahje = -21.25 + (.584 * pituus) + (r-1)
  
  #Kengän koko:		kenka = 30 - (.028 * pituus) + (.028 * vyota) + (.17 * paino) + (r - 2);
  r = runif(n=nsim,min=0,max=5)
  kenka = 30 - (.028 * pituus) + (.028 * vyota) + (.17 * paino) + (r-2)
  kenka
  
  #Työpaikka (0 = Ulkotyö,1 = Sisätyö)
  tyo = runif(n=nsim,min=0,max=1)
  #Sukupuoli(0 = mies tai 1 = nainen)
  sukup = runif(n=nsim,min=0,max=1)
  
  dat <- data.frame(vyotaro=vyota,paino,pituus,hattu,kaulus,hiha,lahje,kenka)
  dat$paino <- round(dat$paino,1)
  dat[,-2] <- sapply(dat[,-2],FUN = round,digits=0)
  dat
}
opnro <- 12345678
dat<-simulate_data(opnro)
library(readxl)
readr::write_csv(dat,paste0("dat_",opnro,".csv"))
getwd()
