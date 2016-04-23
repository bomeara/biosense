#' Fit various BM1 and OU1 to a single trait, using measurement error
#' @param data A data.frame with columns for species names, species mean, and species standard error
#' @param phy A phylo object.
#' @param reconcile If TRUE, use geiger's treedata() function to prune phylogeny and data to same leaf set
#'
#' @return A data.frame with returned parameters
#' @details
#' The returned object includes the likelihoods, AIC, and AIC weights of BM1 and OU1, sigma for each,
#' alpha and theta for OU, and model-averaged estimates for sigma and alpha.
#' @export
DoUnivariateOUwieDredge <- function(data, phy) {

}

#' Get phylogenetic means for species (including ones with missing data)
#' @param data A data.frame with first column species name, other columms trait data. NA are allowed
#' @param phy A tree for all species in the data.
#' @param model A model for phylopars. Options are "BM", "OU" "lambda", "kappa", "delta", "EB", "star"
#' @param phylo_correlated If TRUE, parameters are estimated assuming traits are correlated. This can be quite slow.
#' @param ... Other options to pass to phylopars()
#'
#' @return list containing means and variances for species, as well as the phylopars object
#' @details
#' Note that this will use same model (but different params) for each column.
#' If you want to use different models, do different subsets of the data
#' @export
GetPhylogeneticMeans <- function(data, phy, model="BM", phylo_correlated=FALSE, pad.missing = TRUE, ...) {
  if(pad.missing) {
    data <- PadData(data, phy$tip.label, strict=FALSE)
  }
  result.phylopars <- Rphylopars::phylopars(trait_data = data, tree=phy, model=model, pheno_error=TRUE, phylo_correlated=phylo_correlated)
  result.list <- list(species.means=result.phylopars$anc_recon[sequence(ape::Ntip(phy)),], species.var=result.phylopars$anc_var[sequence(Ntip(phy)),], result.phylopars = result.phylopars)
  return(result.list)
}
