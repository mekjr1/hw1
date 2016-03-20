
require('hash')
require('Xmisc')

parser <- ArgumentParser$new()


## add a character object
 parser$add_argument( '--files',type='character',required=TRUE,help='names of input files')
 ## add an integer object with default
 parser$add_argument('--query',type='string',default=NULL,help='query to execute, max or min.')
 ## add a numeric object with default
 parser$add_argument('--out',type='string',default=1,help='A number.')
parser$add_usage('Xmisc-ArgumentParser.R [options]')
parser$add_description('An executable R script parsing arguments from Unix-like command line.')






in_files=0
if (is.null(class(files)) || is.null(class(query))) {
print_help(opt_parser)
  stop("USAGE: Rscript week3_1.R inputfiles ", call.=FALSE)
} 


arrWt=hash()
arrHt=hash()
j=1

in_fil <-class('files')
print(in_fil)
for(i in in_fil) {             	# Note: 1
	Persons <- read.table(i, sep=',', header=T)
	arrWt[j]=max(Persons$weight)
	arrHt[j]=max(Persons$height)
	j=j+1
}
max_weights =values(arrHt)
max_width=values(arrWt)

max_w <- max(values(arrWt))
max_h <- max(values(arrHt))

print(max(values(arrWt)))
print(max(values(arrHt)))
print(summary(as.list(arrHt)))

