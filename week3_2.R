require('hash')
require('optigrab')




files <- opt_get(name='files', n=3, required = TRUE, description = "output file name ")
query <- opt_get(name='query', required = TRUE, description = "query, it should be max or min ")
out <-opt_get(name='out', required = TRUE, description = "output file name ")
#opt_help(name = c("files", "query","out"), opts = c(files, query,out)
print(opt_help())




arrWt=hash()
arrHt=hash()
j=1

in_fil <-opt_get('files', n=3)
find_max <- function(files, outf){
	for(i in in_fil) {             	# Note: 1
	Persons <- read.table(i, sep=',', header=T)
	arrWt[i]=max(Persons$weight)
	arrHt[i]=max(Persons$height)
	j=j+1
	}	
	

	print('Printing Max Heights')
	print(values(arrHt))
	print('-------------------------')
	print('Printing Max Weights')
	print(values(arrWt))
	

fileConn<-file(out)
writeLines(values(arrHt), fileConn)
close(fileConn)


	return(NULL)
}
find_min <- function(files, out){
	for(i in in_fil) {             	# Note: 1
	Persons <- read.table(i, sep=',', header=T)
	arrWt[i]=min(Persons$weight)
	arrHt[i]=min(Persons$height)
	j=j+1
	}	


	print('Printing Min Heights')
	print(values(arrHt))
	print('-------------------------')
	print('Printing Min Weights')
	print(values(arrWt))
	return(NULL)
}
if (query=='max') {
 find_max(files,out)
} else{
	find_min(files,out)
}
