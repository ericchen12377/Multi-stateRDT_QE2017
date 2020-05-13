#' @title Consumer's Risk for Multi-State RDT with Multiple Failure Modes
#'
#' @description Define the consumer risk function which gets the probability of passing the test when the lower level reliability requirements are not satisfied under different failure modes (for Multi-state RDT, Multiple Failure Modes).
#'
#' @param n RDT sample size
#' @param cvec Maximum allowable failures for each separate period
#' @param pivec Failure probability for each seperate period
#' @param Rvec Lower level reliability requirements for each cumulative period from the begining of the test.
#' @return Probability for consumer's risk
#' @examples
#' pi1 <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
#' pi2 <- pi_MCSim_beta(M = 5000, seed = 10, a = 2, b = 18)
#' MFM_consumerrisk(n = 10, cvec = c(1, 1), pivec = cbind(pi1, pi2), Rvec = c(0.8, 0.7))
#' @export


MFM_consumerrisk <- function(n, cvec, pivec, Rvec){

  sum1 <- rep(NA, length(1:dim(pivec)[1]))
  sum2 <- rep(NA, length(1:dim(pivec)[1]))

  for(i in 1:dim(pivec)[1]){
    sum2[i] <- MFM_core(n, cvec, pivec[i,])
    sum1[i] <- sum2[i] * MFM_Indicator(pivec[i,], Rvec)
  }
  return(1 - (sum(sum1) / sum(sum2)))
}
