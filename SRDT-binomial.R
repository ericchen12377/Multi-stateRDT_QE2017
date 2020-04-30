R1=0.8
N=15000
pi<-rbeta(N,1,1)
pi<-rbeta(N,2,18)
pi<-rbeta(N,4,16)
pi<-rbeta(N,10,15)
pi<-rbeta(N,10,10)
beta<-0.1
beta<-0.01
beta<-0.05

###############plot###############
par(family = 'serif')
x <- seq(0, 1, length = 100)
plot(x,dbeta(x,1,1),axes = FALSE,type="l",ylim=c(0,8),cex.lab=2,main="",xlab=expression(pi),ylab=expression(pi))
lines(x,dbeta(x,2,18),type="l")
lines(x,dbeta(x,4,16),type="l")
lines(x,dbeta(x,10,15),type="l")
lines(x,dbeta(x,10,10),type="l")
axis(1,cex.axis=1.5)
axis(2,cex.axis=1.5)
text(0.9,1.5, "Beta(1,1)",cex=1.6)
text(0.1,7.6, "Beta(2,18)",cex=1.6) 
text(0.21,5, "Beta(4,16)",cex=1.6) 
text(0.4,4.5, "Beta(10,15)",cex=1.6)
text(0.65,3.5, "Beta(10,10)",cex=1.6) 
##################################

######define the indicator function
bIndicator<-function(pi1,r1)
{
  if(pi1<1-r1) 
    return(1)
  else 
    return(0)
}

######define the inside sum core of integration fucntion
bcore<-function(n,c1,pi1){
  sum1<-c()
  for(i in 0:c1){
    sum1[i+1]<-dbinom(i,n,prob=pi1)
  }
    return(sum(sum1))
}

######define the consumer risk function
bconsumerrisk<-function(N,n,c1,pi1,r1){
    sum1<-c()
    sum2<-c()
    for(i in 1:N){
      sum1[i]<-bcore(n,c1,pi1[i])*bIndicator(pi1[i],r1)
      sum2[i]<-bcore(n,c1,pi1[i])
    }
    return(1-sum(sum1)/sum(sum2))
  }
  

#############
nnb<-c()
crb<-c()

c1<-0
n=c1
while(bconsumerrisk(N,n,c1,pi,R1)>=beta){
  n=n+1
}
nnb[1]<-n
crb[1]<-bconsumerrisk(N,n,c1,pi,R1)
c1<-1
n=c1
bconsumerrisk(N,n,c1,pi,R1)
while(bconsumerrisk(N,n,c1,pi,R1)>=beta){
  n=n+1
}
nnb[2]<-n
crb[2]<-bconsumerrisk(N,n,c1,pi,R1)
c1<-2
while(bconsumerrisk(N,n,c1,pi,R1)>=beta){
  n=n+1
}
nnb[3]<-n
crb[3]<-bconsumerrisk(N,n,c1,pi,R1)

c1<-3

while(bconsumerrisk(N,n,c1,pi,R1)>=beta){
  n=n+1
}
nnb[4]<-n
crb[4]<-bconsumerrisk(N,n,c1,pi,R1)

c1<-4

while(bconsumerrisk(N,n,c1,pi,R1)>=beta){
  n=n+1
}
nnb[5]<-n
crb[5]<-bconsumerrisk(N,n,c1,pi,R1)

c1<-5

while(bconsumerrisk(N,n,c1,pi,R1)>=beta){
  n=n+1
}
nnb[6]<-n
crb[6]<-bconsumerrisk(N,n,c1,pi,R1)

c1<-6

while(bconsumerrisk(N,n,c1,pi,R1)>=beta){
  n=n+1
}
nnb[7]<-n
crb[7]<-bconsumerrisk(N,n,c1,pi,R1)

nnb
crb


