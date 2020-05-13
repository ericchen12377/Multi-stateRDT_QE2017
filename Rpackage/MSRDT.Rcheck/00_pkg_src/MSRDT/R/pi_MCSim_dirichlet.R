#' @title Dirichlet Prior Simulation for Multi-state RDT
#'
#' @description Define the simulation function to generate failure probability with Dirichlet prior distributions as conjugate prior to multinomial distributions (for multi-state RDT).
#'
#' @param M Simulation sample size
#' @param seed Random seed for random sample
#' @param par Parameters for dirichlet distribution
#' @return Vector of failure probability sample
#' @examples
#' pi <- pi_MCSim_dirichlet(M = 5000, seed = 10, par = c(1, 1, 1))
#' print(pi[1:3, ])
#' @seealso \code{\link{pi_MCSim_beta}}
#' @export
#' @importFrom gtools rdirichlet

pi_MCSim_dirichlet <- function(M, seed, par){
  #requireNamespace("gtools")
  set.seed(seed)
  return(rdirichlet(M, par))
}

