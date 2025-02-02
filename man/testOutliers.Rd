\name{testOutliers}
\alias{testOutliers}
\alias{testOutliers.metaplus}
\title{
Tests for the presence of outliers.
}
\description{
For the \eqn{t}-distribution models this is a test that the degrees of freedom is infinitite, or equivalently that it's inverse is zero. For the mixture-normal model it is a test that the proportion of outliers is zero. As both tests involve a parameter on the boundary of the parameter space, asymptotic theory does not apply, so a parametric bootstrap is performed to determine the empirical distribution of the test statistic under the null hypothesis. The observed likelihood ratio statistic is then compared to this distribution to determine the p value.
}
\usage{
\method{testOutliers}{metaplus}(object,R = 999)
}
\arguments{
  \item{object}{
The meta-analysis for which the presence of outliers is to be tested.
}
  \item{R}{
Number of simulations (parametric bootstraps) used in testing the hypothesis. Initially, it may be useful to set this to a smaller value, to allow faster execution time.
}
}
\value{
\item{pvalue}{p value obtained from parametric bootstrap}
\item{observed}{Observed value of the likelihood ratio test statistic}
\item{sims}{Simulated values of the test statistic under the null hypothesis}
}
\note{Running the default number of bootstrap samples may take considerable time, of the order of hours. Use of the parallel options will improve these times. For a preliminary guide to whether there are outliers, this is indicated by a reduction in AIC or BIC with the robust model, and a change in the estimated mean effect.}
\author{
Ken Beath <ken.beath@mq.edu.au>
}
\examples{
\dontrun{
cdp3 <- metaplus(cdp$yi,cdp$sei,plotci=TRUE,slab=cdp$study,random="mixture")
summary(testOutliers(cdp3))
##
system.time(cdp3_t <- metaplus(cdp$yi,cdp$sei,plotci=TRUE,slab=cdp$study,random="t-dist")) ## 42 seconds
system.time(to1 <- testOutliers(cdp3_t, R=50)) ## 44 seconds
system.time(to2 <- testOutliers(cdp3_t, R=50, parallel="multicore", ncpus=8)) ## 20 seconds
system.time(to3 <- testOutliers(cdp3_t, R=250)) ## 290 seconds
system.time(to4 <- testOutliers(cdp3_t, R=250, parallel="multicore", ncpus=8)) ## 48 seconds

summary(to1)

}
}
\keyword{methods}
