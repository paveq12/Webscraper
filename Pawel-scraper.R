library(rvest)
library(stringr)


dane_strony<-data.frame()


for (a in c(2,3)) {
  
  url1<-"http://www.pracuj.pl/praca/it%20-%20rozw%c3%b3j%20oprogramowania;cc,5016/?pn="
  
  url<-paste(url1,a,sep = "")
  
  
  
  link <- read_html(url)
  
  
  h<-html_nodes(link,'h2 [itemprop="title"]')
  dane<-html_text(h)
  
  
  for (i in 1:length(dane)) {
    dane_strony[i+(50*(a-2)),1]<-dane[i]
  }
}

dane_strony[,1]




for (a in c(2,3)) {
  
  url1<-"http://www.pracuj.pl/praca/it%20-%20rozw%c3%b3j%20oprogramowania;cc,5016/?pn="
  
  url<-paste(url1,a,sep = "")
  
  
  
  link <- read_html(url)
  
  
  h<-html_nodes(link,'h3 [itemprop="name"]')
  dane<-html_text(h)
  
  
  for (i in 1:length(dane)) {
    dane_strony[i+(50*(a-2)),2]<-dane[i]
  }
}

dane_strony[,2]



for (a in c(2,3)) {
  
  url1<-"http://www.pracuj.pl/praca/it%20-%20rozw%c3%b3j%20oprogramowania;cc,5016/?pn="
  
  url<-paste(url1,a,sep = "")
  
  
  
  link <- read_html(url)
  
  
  h<-html_nodes(link,'span [itemprop="addressRegion"]')
  dane<-html_text(h)
  
  
  for (i in 1:length(dane)) {
    dane_strony[i+(50*(a-2)),3]<-dane[i]
  }
}

dane_strony[,3]



a<-sample(4000:12000,100)
a

for (s in 1:100) {
  dane_strony[s,4]<-a[s]
}



colnames(dane_strony)<-c("Stanowisko","Firma","Lokalizacja","Wynagrodzenie")
write.csv(dane_strony, file = "Praca_Webcraper.csv",row.names=FALSE)
data <- read.csv(file = "C:/Users/Komputer/Documents/Praca_Webcraper.csv")

#czyszczenie danych
data$Lokalizacja<-gsub(",.*","",data$Lokalizacja)
data$Lokalizacja
data$Lokalizacja <- trimws(data$Lokalizacja)
data$Lokalizacja<-gsub(" .*","",data$Lokalizacja)
data$Lokalizacja[51] <- "Warszawa"
data$Lokalizacja[51]

write.csv(data, file = "Praca_WebcraperV2.csv",row.names=FALSE)

data <- read.csv(choose.files())

data$Lokalizacja


