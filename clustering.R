rm(list=ls()) # probably should not run this if you are using seperate files for each step

library(cluster)

components = pr.out$x[, 1:5] # however many components used
Knum = 3 # number of clusters, can optimize this later

km.out = kmeans(components, Knum, nstart=20) 

# silhouette is one metric to measure the goodness of fit of clusters, think of it like R^2
sil_score = silhouette(km.out$cluster, dist(components))
avg_sil = mean(sil_score[, 3])
avg_sil

for (i in 1:Knum) {
  row_indices <- which(km.out$cluster == i)

  #print whatever we want to see from each cluster, I was thinking dates but we can change it
  cluster_data <- pca_data[row_indices, "date"]
  
  print(cluster_data)
  cat("\n")
}
