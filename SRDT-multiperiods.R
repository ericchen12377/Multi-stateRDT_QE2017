######initial values
###c1 is maximum failure in period 1
###c2 is maximum failure in period 1 and period 2
R1=0.8
R2=0.6
beta<-0.05
beta<-0.01
beta<-0.1
N=15000
set.seed(10)
par=c(1,1,1)
pi<-rdirichlet(N,par)
par=c(1,1,8)
pi<-rdirichlet(N,par)
par=c(3,3,24)
pi<-rdirichlet(N,par)
par=c(2,2,6)
pi<-rdirichlet(N,par)
par=c(6,6,18)
pi<-rdirichlet(N,par)
par=c(4,1,5)
pi<-rdirichlet(N,par)
par=c(20,5,25)
pi<-rdirichlet(N,par)
par=c(12,3,15)
pi<-rdirichlet(N,par)
par=c(1,4,5)
pi<-rdirichlet(N,par)
par=c(3,12,15)
pi<-rdirichlet(N,par)
par=c(2,4,4)
pi<-rdirichlet(N,par)
par=c(6,12,12)
pi<-rdirichlet(N,par)
par=c(4,2,4)
pi<-rdirichlet(N,par)
par=c(12,6,12)
pi<-rdirichlet(N,par)



######define the indicator function
Indicatorp<-function(pi1,pi2,r1,r2)
{
  if(pi1<1-r1 & pi1+pi2<1-r2) 
    return(1)
  else 
    return(0)
}

######define the inside sum core of integration fucntion
corep<-function(n,c1,c2,pi1,pi2){
  sum1<-c()
  sum2<-c()
  if(c1==0&c2==0){
    return(dmultinom(c(c1,c2,n-c1-c2), prob=c(pi1,pi2,1-pi1-pi2)))
  } 
  else
    if(c1==0&c2!=0){
      for(j in 0:(c2)){
        sum2[j+1]<-dmultinom(c(c1,j,n-c1-j), prob=c(pi1,pi2,1-pi1-pi2))
      }
      return(sum(sum2))
    }
  else 
    if(c1!=0){
      for (i in 0:c1){
        sum2<-c()
        for(j in 0:(c2+c1-i)){
          sum2[j+1]<-dmultinom(c(i,j,n-i-j), prob=c(pi1,pi2,1-pi1-pi2))
        }
        sum1[i+1]<-sum(sum2)
      }
      return(sum(sum1))
    }
}

######define the consumer risk function
consumerriskp<-function(N,n,c1,c2,pi1,pi2,r1,r2){
  if(n>=c2){
    sum1<-c()
    sum2<-c()
    for(i in 1:N){
      sum1[i]<-corep(n,c1,c2,pi1[i],pi2[i])*Indicatorp(pi1[i],pi2[i],r1,r2)
      sum2[i]<-corep(n,c1,c2,pi1[i],pi2[i])
    }
    return(1-sum(sum1)/sum(sum2))
  }
  
}




ptm <- proc.time();ptm
######test optimal numbers
nnp<-c()
crp<-c()
p<-c()
c1<-0
c2<-0
n=1
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[1]<-n
crp[1]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-0
c2<-1
n=c1+c2
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[2]<-n
crp[2]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-1
c2<-0
n=c1+c2
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[3]<-n
crp[3]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-0
c2<-2
n=c1+c2
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[4]<-n
crp[4]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-1
c2<-1
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[5]<-n
crp[5]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-2
c2<-0
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[6]<-n
crp[6]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)

c1<-0
c2<-5
n=c1+c2
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[7]<-n
crp[7]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-1
c2<-4
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[8]<-n
crp[8]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-2
c2<-3
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[9]<-n
crp[9]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-3
c2<-2
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[10]<-n
crp[10]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-4
c2<-1
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[11]<-n
crp[11]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-5
c2<-0
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[12]<-n
crp[12]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-0
c2<-6
n=c1+c2
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[13]<-n
crp[13]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-1
c2<-5
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[14]<-n
crp[14]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-2
c2<-4
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[15]<-n
crp[15]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-3
c2<-3
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[16]<-n
crp[16]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-4
c2<-2
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[17]<-n
crp[17]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-5
c2<-1
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[18]<-n
crp[18]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-6
c2<-0
while(consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnp[19]<-n
crp[19]<-consumerriskp(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
proc.time()-ptm
nnp
crp
