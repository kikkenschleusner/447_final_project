pr.out <- prcomp(pca_data, scale=TRUE)
names(pr.out)
dim(pr.out$x)

pr.out$rotation
biplot(pr.out, scale=0, xlim=c(-5,5), ylim=c(-5,5))
pr.out$x

pr.out$sdev
pr.var=pr.out$sdev^2
pr.var
pve=pr.var/sum(pr.var)
pve
plot(pve, xlab="Principal Component", 
     ylab="Proportion of Variance Explained", 
     ylim=c(0,1),type='b')
plot(cumsum(pve), xlab="Principal Component", 
     ylab="Cumulative Proportion of Variance Explained", 
     ylim=c(0,1),type='b')
