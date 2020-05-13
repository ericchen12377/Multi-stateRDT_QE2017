pkgname <- "MSRDT"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
base::assign(".ExTimings", "MSRDT-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('MSRDT')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("MFM_Indicator")
### * MFM_Indicator

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MFM_Indicator
### Title: Binary Indicator for Multi-State RDT with Multiple Failure Modes
### Aliases: MFM_Indicator

### ** Examples

MFM_Indicator(pivec = c(0.1, 0.2), Rvec = c(0.8, 0.6))
MFM_Indicator(pivec = c(0.1, 0.2, 0.1), Rvec = c(0.8, 0.6, 0.4))
MFM_Indicator(pivec = c(0.1, 0.4), Rvec = c(0.8, 0.7))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MFM_Indicator", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MFM_consumerrisk")
### * MFM_consumerrisk

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MFM_consumerrisk
### Title: Consumer's Risk for Multi-State RDT with Multiple Failure Modes
### Aliases: MFM_consumerrisk

### ** Examples

pi1 <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
pi2 <- pi_MCSim_beta(M = 5000, seed = 10, a = 2, b = 18)
MFM_consumerrisk(n = 10, cvec = c(1, 1), pivec = cbind(pi1, pi2), Rvec = c(0.8, 0.7))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MFM_consumerrisk", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MFM_core")
### * MFM_core

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MFM_core
### Title: Probability Core for Multi-State RDT with Multiple Failure Modes
### Aliases: MFM_core

### ** Examples

#Example for two failure modes
pi1 <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
pi2 <- pi_MCSim_beta(M = 5000, seed = 10, a = 2, b = 18)
MFM_core(n = 10, cvec = c(1, 1), pivec = c(pi1[1], pi2[1]));
#The function also works for more than two failure modes,
however, may increase the computation cost.
MFM_core(n = 10, cvec = c(1, 1, 1), pivec = c(0.8, 0.9, 0.8));



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MFM_core", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MFM_optimal_n")
### * MFM_optimal_n

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MFM_optimal_n
### Title: Optimal Test Sample Size for Multi-State RDT with Multiple
###   Failure Modes
### Aliases: MFM_optimal_n

### ** Examples

pi1 <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
pi2 <- pi_MCSim_beta(M = 5000, seed = 10, a = 2, b = 18)
MFM_optimal_n(cvec = c(1, 1), pivec = cbind(pi1, pi2), Rvec = c(0.8, 0.7), thres_CR = 0.05)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MFM_optimal_n", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MPCum_consumerrisk")
### * MPCum_consumerrisk

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MPCum_consumerrisk
### Title: Consumer's Risk for Multi-State RDT with Multiple Periods and
###   Criteria for Cumulative Periods
### Aliases: MPCum_consumerrisk

### ** Examples

pi <- pi_MCSim_dirichlet(M = 5000, seed = 10, par = c(1, 1, 1))
MPCum_consumerrisk(n = 10, cvec = c(1, 1), pivec = pi, Rvec = c(0.8, 0.7))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MPCum_consumerrisk", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MPCum_core")
### * MPCum_core

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MPCum_core
### Title: Probability Core for Multi-State RDT with Multiple Periods and
###   Criteria for Cumulative Periods
### Aliases: MPCum_core

### ** Examples

#Example for two periods
pi <- pi_MCSim_dirichlet(M = 5000, seed = 10, par = c(1, 1, 1))
MPCum_core(n = 10, cvec = c(1, 1), pivec = pi[1, ]);
#The function also works for more than two periods, however, may increase the computation cost.
pi <- pi_MCSim_dirichlet(M = 5000, seed = 10, par = c(1, 1, 1, 1))
MPCum_core(n = 10, cvec = c(1, 1, 1), pivec = pi[1, ]);



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MPCum_core", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MPCum_optimal_n")
### * MPCum_optimal_n

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MPCum_optimal_n
### Title: Optimal Test Sample Size for Multi-State RDT with Multiple
###   Periods and Criteria for Cumulative Periods
### Aliases: MPCum_optimal_n

### ** Examples

pi <- pi_MCSim_dirichlet(M = 5000, seed = 10, par = c(1, 1, 1))
MPCum_optimal_n(cvec = c(1,1), pivec = pi, Rvec = c(0.8, 0.7), thres_CR = 0.05)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MPCum_optimal_n", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MPSep_consumerrisk")
### * MPSep_consumerrisk

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MPSep_consumerrisk
### Title: Consumer's Risk for Multi-State RDT with Multiple Periods and
###   Criteria for Separate Periods
### Aliases: MPSep_consumerrisk

### ** Examples

pi <- pi_MCSim_dirichlet(M = 5000, seed = 10, par = c(1, 1, 1))
MPSep_consumerrisk(n = 10, cvec = c(1,1), pi = pi, Rvec = c(0.8, 0.7))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MPSep_consumerrisk", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MPSep_core")
### * MPSep_core

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MPSep_core
### Title: Probability Core for Multi-State RDT with Multiple Periods and
###   Criteria for Separate Periods
### Aliases: MPSep_core

### ** Examples

#Example for two periods
pi <- pi_MCSim_dirichlet(M = 5000, seed = 10, par = c(1, 1, 1))
MPSep_core(n = 10, cvec = c(1, 1), pivec = pi[1, ]);
#The function also works for more than two periods, however, may increase the computation cost.
pi <- pi_MCSim_dirichlet(M = 5000, seed = 10, par = c(1, 1, 1, 1))
MPSep_core(n = 10, cvec = c(1, 1, 1), pivec = pi[1, ]);



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MPSep_core", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MPSep_optimal_n")
### * MPSep_optimal_n

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MPSep_optimal_n
### Title: Optimal Test Sample Size for Multi-State RDT with Multiple
###   Periods and Criteria for Separate Periods
### Aliases: MPSep_optimal_n

### ** Examples

pi <- pi_MCSim_dirichlet(M = 5000, seed = 10, par = c(1, 1, 1))
MPSep_optimal_n(cvec = c(1,1), pivec = pi, Rvec = c(0.8, 0.7), thres_CR = 0.05)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MPSep_optimal_n", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("MP_Indicator")
### * MP_Indicator

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MP_Indicator
### Title: Binary Indicator for Multi-State RDT with Multiple Periods
### Aliases: MP_Indicator

### ** Examples

MP_Indicator(pivec = c(0.1, 0.2), Rvec = c(0.8, 0.6))
MP_Indicator(pivec = c(0.1, 0.2, 0.1), Rvec = c(0.8, 0.6, 0.4))
MP_Indicator(pivec = c(0.1, 0.3), Rvec = c(0.8, 0.7))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MP_Indicator", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("bIndicator")
### * bIndicator

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: bIndicator
### Title: Binary Indicator for Binomial RDT
### Aliases: bIndicator

### ** Examples

bIndicator(pi = 0.05, R = 0.9)
bIndicator(pi = 0.2, R = 0.9)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("bIndicator", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("bconsumerrisk")
### * bconsumerrisk

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: bconsumerrisk
### Title: Consumer's Risk for Binomial RDT
### Aliases: bconsumerrisk

### ** Examples

pi <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
bconsumerrisk(n = 10, c = 2, pi = pi, R = 0.8);



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("bconsumerrisk", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("bcore")
### * bcore

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: bcore
### Title: Probability Core for Binomial RDT
### Aliases: bcore

### ** Examples

bcore(n = 10, c = 2, pi = 0.2)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("bcore", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("boptimal_n")
### * boptimal_n

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: boptimal_n
### Title: Optimal Test Sample Size for Binomial RDT
### Aliases: boptimal_n

### ** Examples

pi <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
boptimal_n(c = 2, pi = pi, R = 0.8, thres_CR = 0.05);



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("boptimal_n", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pi_MCSim_beta")
### * pi_MCSim_beta

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pi_MCSim_beta
### Title: Beta Prior Simulation for Binomial RDT
### Aliases: pi_MCSim_beta

### ** Examples

pi <- pi_MCSim_beta(M = 5000, seed = 10, a = 1, b = 1)
print(pi)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pi_MCSim_beta", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pi_MCSim_dirichlet")
### * pi_MCSim_dirichlet

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pi_MCSim_dirichlet
### Title: Dirichlet Prior Simulation for Multi-state RDT
### Aliases: pi_MCSim_dirichlet

### ** Examples

pi <- pi_MCSim_dirichlet(M = 5000, seed = 10, par = c(1, 1, 1))
print(pi[1:3, ])



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pi_MCSim_dirichlet", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
