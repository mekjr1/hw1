#author: Abdul Meque

#This script uses hash data structure to handle the data
require('hash')

#optgrab package is used to read the commandline options and arguments
require('optigrab')

#grab the inputs
files <- opt_get(name='files', n=3, required = TRUE, description = "output file name ")
query <- opt_get(name='query', required = TRUE, description = "query, it should be max or min ")
out <-opt_get(name='out', required = TRUE, description = "output file name ")
#opt_help(name = c("files", "query","out"), opts = c(files, query,out)
print(opt_help())


find_max <- function(files, outf){
	arrWt=hash()
	arrHt=hash()
	for(i in files) {             	# Note: 1
	Persons <- read.table(i, sep=',', header=T)
	.set(arrWt,i,max(Persons$weight))
	.set(arrHt,i,max(Persons$height))
	}	

	hIndex=order(values(arrHt),decreasing=T)
	
	hKey=keys(arrHt)[hIndex[1]]
	wIndex=order(values(arrWt),decreasing=T)
	wKey=keys(arrHt)[wIndex[1]]
	
	line2 =	c("height",values(arrHt), hKey)
	line3 = c("weight",values(arrWt), wKey)
	res=matrix(c(line2,line3),nrow=2,byrow=T)
	colnames(res) = c('type',files, 'max')

print(line2)
print(line3)

write.csv(res, file =out,row.names=FALSE)


	return(NULL)
}
find_min <- function(files, out){
	arrWt=hash()
	arrHt=hash()
	for(i in files) {             	# Note: 1
	Persons <- read.table(i, sep=',', header=T)
	.set(arrWt,i,min(Persons$weight))
	.set(arrHt,i,min(Persons$height))
	}	
	#ordering the height values to get the lowest
	hIndex=order(values(arrHt),decreasing=F)
	#extracting the highest
	hKey=keys(arrHt)[hIndex[1]]
	
	#ordering the height values to get the lowest
	wIndex=order(values(arrWt),decreasing=F)
	wKey=keys(arrHt)[wIndex[1]]
	
	#preparing the lines to be printed
	line2 =	c("height",values(arrHt), hKey)
	line3 = c("weight",values(arrWt), wKey)
	res=matrix(c(line2,line3),nrow=2,byrow=T)
	colnames(res) = c('type',files, 'min')

print(line2)
print(line3)

write.csv(res, file =out,row.names=FALSE)
	
	return(NULL)
}
if (query=='max') {
 find_max(files,out)
} else{
	find_min(files,out)
}
