# import-plate-reader-xls-data-
--------An I/O data script for Plate Reader Wallac 1420--------

Import xls data from Plate Reader Wallac 1420, collect all measures per plate from excel sheet "Plate" together and export it into new plate xlsx files. 

**For example:**

`<plate1 #0.xls>`,`<plate1 #1.xls>`,`<plate1 #2.xls>`,`<plate1 #3.xls>`, --> `<plate1.xlsx>`.

`<plate2 #0.xls>`,`<plate2 #1.xls>`,`<plate2 #2.xls>`,`<plate2 #3.xls>`, --> `<plate2.xlsx>`.
### Why it is needed?
When you measure the growth curve in the Plate Reader, it is important to collect all files easily to plot the growth curve graph. Every xls file stores every time point of measurement for all of the samples (wells). 

### How to use?
1. To aggregate files correctly in one `<plate1.xlsx>` together, input files should be named properly. A xls file `<plate1 #0.xls>` with `#Num`, where Num is number of measurment starts with 0 and `plate1` where `1` is Num of plate starts with 1. All xls file shoud be stored in one folder. 
2. Every `<plateNum #Num.xls>` file should have `Plate` worksheet with measurments presented in form of well plate.
3. In the `Import plate reader xls dat.R` file specify number of input files in the folder in `files_in_folder` variable,  number of measurements in `count_points` variable and repository containing input xls files in `folder_path` variable.
````
files_in_folder= 20 #number of files
count_points=5 #number of measurements
folder_path= "E:/input_data" #input data folder
````
4. Run entire code
5. Done

**import plate reader xls data** requires listed below open source [CRAN](https://cran.r-project.org) packages: 
```
writexl
readxl 
rio
xlsx
dplyr
```  
**Note!** The **import plate reader xls data** script has been designed and tested specially for Plate Reader Wallac 1420 machine. Some changes may be needed if use another plate reader for the growth curve measure. For instance, change the name of worksheet in input xls file in `sheet= "Plate"` variable, or change extension of input file from xls to xlsx. 
