library("readxl")
library("writexl")
library(rio)
library(xlsx)
library(dplyr)

files_in_folder= 20 #здесь кол-во файлов
count_points=5 #кол-во измерений
folder_path= "E:/input_data" #папка входных данных
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
    datapath= file.path(folder_path,paste(filename,".xls", sep=""))
    dataset <- read_excel(datapath, sheet = sheet)
    Date_modified=file.mtime(datapath)
    if (grepl("#0", xlsfiles[N])== TRUE) {
      Date_modified_0=file.mtime(datapath)
      dataset[1, 7] = 0
    } else {
      dataset[1, 7]=as.numeric(difftime(Date_modified, Date_modified_0, units="hours"))
    }
    dataset[1, 1]=as.character(Date_modified)
    
    
    

    
    File=rbind(File, dataset)
  }
  print(i)
  filepath=paste(paste(folder_path,"/plate_", sep=""),i, ".xlsx", sep="")
  export(File, filepath)
  rm(File)
  print(xlsfiles[n:k])
  n=n+count_points
  k=k+count_points
}














