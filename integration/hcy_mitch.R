library("mitch")

hepg2<-read.table("hepg2_hcy_deseq.tsv",header=T,row.names=1,sep="\t")

hmec1<-read.table("hmec1_hcy_deseq.tsv",header=T,row.names=1,sep="\t")

x<-list("hepg2"=hepg2,"hmec1"=hmec1)

y<-mitch_import(x,"deseq2")

geneid<-rownames(y)

genesymbol<-sapply(strsplit(rownames(y)," "),"[[",2)

gt<-data.frame(geneid,genesymbol)

y<-mitch_import(x,"deseq2",geneTable=gt)

write.table(y,file="merged.rnk",sep="\t",quote=F)

genesets<-gmt_import("ReactomePathways.gmt")

res<-mitch_calc(y,genesets,priority="effect",resrows=200)

write.table(res$enrichment_result,file="enrichment_table.tsv",quote=F,sep="\t")

head(res$enrichment_result)

#unlink("myreport.html") ; mitch_report(res,"myreport.html")

mitch_plots(res,outfile="mycharts.pdf")

