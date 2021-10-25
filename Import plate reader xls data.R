library("readxl")
library("writexl")
library(rio)
library(xlsx)

files_in_folder= 24 #здесь кол-во файлов
count_points=4 #кол-во измерений
files_in_folder=files_in_folder/count_points

xlsfiles= c()
for(i in 1:files_in_folder) {
  q=paste("plate", i, sep="")
  for (n in 0:(count_points-1)) {
    w= paste(q, "#")
    w= paste(w, n, sep="")
    xlsfiles=c(xlsfiles, w)
  }
}  

n=1
k=count_points
filename= NULL
sheet= "Plate"
for (i in 1:files_in_folder) {
  File=NULL
  xlsfiles[n:k]
  for(N in n:k) {
    xlsfiles[N]
    filename= xlsfiles[N]
    datapath= file.path("D:/input_data",paste(filename,".xls", sep=""))
    dataset <- read_excel(datapath, sheet = sheet)
    File=rbind(File, dataset)
  }
  print(i)
  filepath=paste("D:/input_data/plate_",i, ".xlsx", sep="")
  export(File, filepath)
  rm(File)
  print(xlsfiles[n:k])
  n=n+count_points
  k=k+count_points
}










