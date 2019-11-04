pdf("scatterplots.pdf")

x<-read.table("detoxros.tsv",header=T,row.names=1)
plot(x,pch=20,ylim=c(-8000,6000))
text(x+200, labels = rownames(x)) 

x<-read.table("il10.tsv",header=T,row.names=1)
plot(x,pch=20,ylim=c(-6846,6000),xlim=c(-6000,7050))
text(x+200, labels = rownames(x)) 


