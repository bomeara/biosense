test_that("phylopars works", {
  data(dennison)
  smaller.dataset <- dennison[,1:4]
  result <- GetPhylogeneticMeans(smaller.dataset, dennison$phy)
  
})
