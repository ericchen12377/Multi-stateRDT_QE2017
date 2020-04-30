######initial values
###c1 is maximum failure in period 1
###c2 is maximum failure in period 2
R1=0.8
R2=0.8

R1=0.8
R2=0.6

beta<-0.05
N=15000
pi1<-rbeta(N,1,1)
pi2<-rbeta(N,1,1)

pi1<-rbeta(N,2,18)
pi2<-rbeta(N,2,18)

pi1<-rbeta(N,4,16)
pi2<-rbeta(N,4,16)

pi1<-rbeta(N,10,15)
pi2<-rbeta(N,10,15)

pi1<-rbeta(N,2,18)
pi2<-rbeta(N,4,16)

pi1<-rbeta(N,2,18)
pi2<-rbeta(N,10,15)

pi1<-rbeta(N,4,16)
pi2<-rbeta(N,10,15)

pi1<-rbeta(N,15,15)
pi2<-rbeta(N,15,15)

pi1<-rbeta(N,10,10)
pi2<-rbeta(N,10,10)

pi1<-rbeta(N,2,18)
pi2<-rbeta(N,10,10)

pi1<-rbeta(N,10,10)
pi2<-rbeta(N,2,18)
###################################




######define the indicator function
Indicatormb<-function(pi1,pi2,r1,r2)
{
  if(pi1< (1-r1) & pi2< (1-r2)) 
    return(1)
  else 
    return(0)
}

######define the inside sum core of integration fucntion
coremb<-function(n,c1,c2,pi1,pi2){
  sum1<-c()
  sum2<-c()
  if(c1==0&c2==0){
    return(dbinom(c1,n,pi1)*dbinom(c2,n,pi2))
  } 
  else
    if(c1==0&c2!=0){
      return(sum(dbinom(c1,n,pi1)*dbinom(0:c2,n,pi2)))
    }
  else 
    if(c1!=0){
      for (i in 0:c1){
        sum1[i+1]<-sum(dbinom(i,n,pi1)*dbinom(0:c2,n,pi2))
      }
      return(sum(sum1))
    }
}

######define the consumer risk function
consumerriskmb<-function(N,n,c1,c2,pi1,pi2,r1,r2){
  if(n>=c2){
    sum1<-c()
    sum2<-c()
    for(i in 1:N){
      sum1[i]<-coremb(n,c1,c2,pi1[i],pi2[i])*Indicatormb(pi1[i],pi2[i],r1,r2)
      sum2[i]<-coremb(n,c1,c2,pi1[i],pi2[i])
    }
    return(1-sum(sum1)/sum(sum2))
  }
  
}


ptm <- proc.time();ptm
######test optimal numbers
nnmb<-c()
crmb<-c()


c1<-0
c2<-0
n=1
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[1]<-n
crmb[1]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-0
c2<-1
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[2]<-n
crmb[2]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-1
c2<-0
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[3]<-n
crmb[3]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-0
c2<-2
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[4]<-n
crmb[4]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-1
c2<-1
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[5]<-n
crmb[5]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-2
c2<-0
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[6]<-n
crmb[6]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)

c1<-0
c2<-5
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[7]<-n
crmb[7]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-1
c2<-4
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[8]<-n
crmb[8]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-2
c2<-3
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[9]<-n
crmb[9]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-3
c2<-2
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[10]<-n
crmb[10]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-4
c2<-1
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[11]<-n
crmb[11]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-5
c2<-0
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[12]<-n
crmb[12]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-0
c2<-6
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[13]<-n
crmb[13]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-1
c2<-5
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[14]<-n
crmb[14]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-2
c2<-4
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[15]<-n
crmb[15]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-3
c2<-3
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[16]<-n
crmb[16]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-4
c2<-2
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[17]<-n
crmb[17]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-5
c2<-1
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[18]<-n
crmb[18]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
c1<-6
c2<-0
n=c1+c2
while(consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)>=beta){
  n=n+1
}
nnmb[19]<-n
crmb[19]<-consumerriskmb(N,n,c1,c2,pi1,pi2,R1,R2)
proc.time()-ptm
nnmb
crmb


