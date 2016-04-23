test_that("phylopars works", {
  data(dennison)
  smaller.dataset <- dennison$data[,c(1,round(seq(from=10, to=dim(dennison$data)[2]-10, length.out=7)))]
  result <- GetPhylogeneticMeans(smaller.dataset, dennison$phy, pad.missing=FALSE)
  expect_less_than(result$species.means[5,5], 0.18)
  expect_greater_than(result$species.means[1,3], 0.36)
  expect_equal(class(result$result.phylopars), "phylopars")
  expect_greater_than(result$species.var, 0)
})
