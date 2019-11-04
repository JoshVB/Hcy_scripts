library("mitch")

GSE9490<-read.table("GSE9490.rnk")

mydata<-read.table("merged.rnk")

colnames(GSE9490)="asmc"

x<-merge(GSE9490,mydata,by=0)

rownames(x)<-x$Row.names

x$Row.names=NULL

genesets<-gmt_import("ReactomePathways.gmt")

res<-mitch_calc(x,genesets,priority="significance")

#mitch_report(res,"compare_GSE9490_mydata_report.html")

mitch_plots(res,outfile="compare_GSE9490_mydata_charts.pdf")
