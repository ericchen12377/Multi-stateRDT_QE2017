#' @title Optimal Test Sample Size for Multi-State RDT with Multiple Failure Modes
#'
#' @description Define the optimal function to find the optimal test plan with minimum test sample size given an acceptable level of consumer's risk (for Multi-state RDT, Multiple Failure Modes).
#'
#' @param cvec Maximum allowable failures for each separate period
#' @param pivec Failure probability for each seperate period
#' @param Rvec Lower level reliability requirements for each cumulative period from the begining of the test.
#' @param thres_CR Threshold (acceptable level) of consumer's risk
#' @return Minimum test sample size
#' @examples
#' pi1 <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
#' pi2 <- pi_MCSim_beta(M = 5000, seed = 10, a = 2, b = 18)
#' MFM_optimal_n(cvec = c(1, 1), pivec = cbind(pi1, pi2), Rvec = c(0.8, 0.7), thres_CR = 0.05)
#' @export


MFM_optimal_n <- function(cvec, pivec, Rvec, thres_CR){
  n <- sum(cvec) + 1
  CR <- MFM_consumerrisk(n, cvec, pivec, Rvec)
  while (CR > thres_CR){
    n <- n + 1
    CR <- MFM_consumerrisk(n, cvec, pivec, Rvec)
  }
  return(n)
}
