#' Convert from spectrum to NDSI
#'
#' @param spectrum An input spectrum. First column is species names.
#'
#' @return A data.frame with species names (first column) and NDSI columns
#' @details
#' Input columns have colnames that have wavelength in nm (as character), other than species names
#' Export columns have colnames that have the pair: 700_805 for NDSI for 700 nm and 805 nm bands
#' @export
ConvertSpectrumToNDSI <- function(spectrum) {
}

#' Aggregate by species. Return mean and standard error
#'
#' @param data A data.frame: first column species, second column trait data
#'
#' @return A data.frame with species name, species mean, and species standard error
#' @export
GetSpeciesMeansWithError <- function(data) {
}

#' Add NA for missing species
#'
#' @param data A data.frame: first column species, remaining columns trait data
#' @param taxa A list of species that should be in the final data.frame. Missing ones will be added
#' @param strict If TRUE, only species listed in taxa will be in output. Otherwise, species will be added but not deleted
#'
#' @return A data.frame: first column species, remaining columns trait data, with NA for some taxa
#' @export
PadData <- function(data, taxa, strict=FALSE) {
}
