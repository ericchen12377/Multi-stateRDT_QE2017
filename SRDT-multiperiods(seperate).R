######initial values
###c1 is maximum failure in period 1
###c2 is maximum failure in period 2
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
Indicatorps<-function(pi1,pi2,r1,r2)
{
  if(pi1<1-r1 & pi1+pi2<1-r2) 
    return(1)
  else 
    return(0)
}

######define the inside sum core of integration fucntion
coreps<-function(n,c1,c2,pi1,pi2){
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
        for(j in 0:(c2)){
          sum2[j+1]<-dmultinom(c(i,j,n-i-j), prob=c(pi1,pi2,1-pi1-pi2))
        }
        sum1[i+1]<-sum(sum2)
      }
      return(sum(sum1))
    }
}

######define the consumer risk function
consumerriskps<-function(N,n,c1,c2,pi1,pi2,r1,r2){
  if(n>=c2){
    sum1<-c()
    sum2<-c()
    for(i in 1:N){
      sum1[i]<-coreps(n,c1,c2,pi1[i],pi2[i])*Indicatorps(pi1[i],pi2[i],r1,r2)
      sum2[i]<-coreps(n,c1,c2,pi1[i],pi2[i])
    }
    return(1-sum(sum1)/sum(sum2))
  }
  
}


######test optimal numbers
ptm <- proc.time();ptm
######test optimal numbers
nnps<-c()
crps<-c()
######test optimal numbers
c1<-0
c2<-0
n=1
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[1]<-n
crps[1]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-0
c2<-1
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[2]<-n
crps[2]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-1
c2<-0
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[3]<-n
crps[3]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-0
c2<-2
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[4]<-n
crps[4]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-1
c2<-1
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[5]<-n
crps[5]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-2
c2<-0
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[6]<-n
crps[6]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)

c1<-0
c2<-5
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[7]<-n
crps[7]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-1
c2<-4
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[8]<-n
crps[8]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-2
c2<-3
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[9]<-n
crps[9]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-3
c2<-2
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[10]<-n
crps[10]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-4
c2<-1
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[11]<-n
crps[11]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-5
c2<-0
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[12]<-n
crps[12]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-0
c2<-6
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[13]<-n
crps[13]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-1
c2<-5
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[14]<-n
crps[14]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-2
c2<-4
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[15]<-n
crps[15]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-3
c2<-3
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[16]<-n
crps[16]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-4
c2<-2
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[17]<-n
crps[17]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-5
c2<-1
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[18]<-n
crps[18]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
c1<-6
c2<-0
n=c1+c2
while(consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)>=beta){
  n=n+1
}
nnps[19]<-n
crps[19]<-consumerriskps(N,n,c1,c2,pi[,1],pi[,2],R1,R2)
proc.time()-ptm
nnps
crps

c1<-0
c1<-1
c1<-4
c2<-c(0,1,2,3,4,5,6,7,8,9,10)
for (i in 1:11){
  while(consumerriskps(N,n,c1,c2[i],pi[,1],pi[,2],R1,R2)>=beta){
    n=n+1
  }
  print(n)
}
nps4<-c(33,33,33,33,33,34,35,36,37,39,40)
nps1<-c(17,18,18,19,21,23,25,27,29,31,33)
nps0<-c(12,13,15,16,18,21,23,25,27,30,32)
plot(c2,nps4,ylim=c(10,46),type = "b",xlab="", axes= FALSE,ylab="Minimum sample size", family="serif"
     ,cex.lab=2,pch=a2,cex=a,lwd=c)
points(c2,nps1,pch=a2,cex=a,col=a2,type = "b",lwd=c)
points(c2,nps0,pch=a2,cex=a,col=a2,type = "b",lwd=c)
axis(2,cex.axis=1.5,lwd=c,pos=-0.3)
axis(1,at = seq(0,10,1),labels=c(0,1,2,3,4,5,6,7,8,9,10),cex.axis=1.5,lwd=c)
mtext(expression(c[2]), side=1, line=2.5,cex=2,at=10)
legend(8,15,bty = "n",legend=c(expression(c[1]),expression(c[1])),lwd=3,cex=a,pch=c(a1,a2))

c1<-0
c1<-1
c1<-4
c1<-6
c2<-c(0,1,2,3,4,5,6,7,8,9,10)
n=25
for (i in 1:11){
  while(consumerriskp(N,n,c1,c2[i],pi[,1],pi[,2],R1,R2)>=beta){
    n=n+1
  }
  print(n)
}
np6<-c()
c2<-c(0,1,2,3,4,5,6,7,8,9,10)
np4<-c(27,29,30,32,33,35,37,39,41,43,46)
np1<-c(15,17,18,20,22,24,26,28,31,33,35)
np0<-c(12,13,15,16,18,21,23,25,27,30,32)
nps4<-c(33,33,33,33,33,34,35,36,37,39,40)
nps1<-c(17,18,18,19,21,23,25,27,29,31,33)
nps0<-c(12,13,15,16,18,21,23,25,27,30,32)
plot(c2,np4,ylim=c(10,46),type = "b",xlab="",axes= FALSE,ylab="Minimum sample size", family="serif"
     ,cex.lab=2,pch=a1,cex=a,col= a2,lwd=c)
points(c2,np4,pch=a1,type = "b",cex=a,col=a2,lwd=c)
points(c2,np0,pch=a1,type = "b",cex=a,col=a2,lwd=c)
points(c2,np1,pch=a1,type = "b",cex=a,col=a2,lwd=c)
axis(2,cex.axis=1.5,lwd=c,pos=-0.3)
axis(1,at = seq(0,10,1),labels=c(0,1,2,3,4,5,6,7,8,9,10),cex.axis=1.5,lwd=c)
mtext(expression(c[2]), side=1, line=2.5,cex=2,at=10)
legend(8.5,20,bty = "n",legend=c(expression(c[1]),expression(c[1])),lwd=3,cex=a,pch=c(a1,a2))


c2<-c(0,1,2,3,4,5,6,7,8,9,10)
np4<-c(27,29,30,32,33,35,37,39,41,43,46)
np1<-c(15,17,18,20,22,24,26,28,31,33,35)
np0<-c(12,13,15,16,18,21,23,25,27,30,32)
nps4<-c(33,33,33,33,33,34,35,36,37,39,40)
nps1<-c(17,18,18,19,21,23,25,27,29,31,33)
nps0<-c(12,13,15,16,18,21,23,25,27,30,32)
plot(c2,np0,ylim=c(10,46),type = "b",xlab="",axes= FALSE,ylab="Minimum sample size", family="serif"
     ,cex.lab=2,pch=17,cex=a,col= 1,lwd=c)
points(c2,np1,pch=a1,type = "b",cex=a,col=1,lwd=c,lty=1)
points(c2,np4,pch=a2,type = "b",cex=a,col=1,lwd=c,lty=1)
points(c2,nps1,pch=a1,cex=a,col=1,type = "b",lwd=c,lty=3)
points(c2,nps4,pch=a2,cex=a,col=1,type = "b",lwd=c,lty=3)
axis(2,cex.axis=1.5,lwd=c,pos=-0.3)
axis(1,at = seq(0,10,1),labels=c(0,1,2,3,4,5,6,7,8,9,10),cex.axis=1.5,lwd=c)
mtext(expression(c[2]), side=1, line=2.5,cex=2,at=10)
legend(7,25,bty = "n",legend=c(expression(I-II:c[1]==0),expression(I:c[1]==1),expression(I:c[1]==4),expression(II:c[1]==1),expression(II:c[1]==4)),lwd=3,cex=a,pch=c(17,a1,a2,a1,a2),col=c(1,1,1,1,1),lty=c(1,1,1,3,3))


c1<-c(0,1,2,3,4,5,6,7,8,9,10)
c2<-c(10,9,8,7,6,5,4,3,2,1,0)
c1<-c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
c2<-c(15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0)
c1<-c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
c2<-c(20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0)
c1<-c(0,1,2,3,4,5,6)
c2<-c(6,5,4,3,2,1,0)
for (i in 1:12){
  n=50
  while(consumerriskps(N,n,c1[i],c2[i],pi[,1],pi[,2],R1,R2)>=beta){
    n=n+1
  }
  print(n)
}
n=65
for (i in 13:21){
  while(consumerriskps(N,n,c1[i],c2[i],pi[,1],pi[,2],R1,R2)>=beta){
    n=n+1
  }
  print(n)
}
n=50
for (i in 1:21){
  while(consumerriskp(N,n,c1[i],c2[i],pi[,1],pi[,2],R1,R2)>=beta){
    n=n+1
  }
  print(n)
}

c2<-0
c2<-1
c2<-4
c2<-6
c1<-c(0,1,2,3,4,5,6,7,8,9,10)
n=10
for (i in 1:11){
  while(consumerriskp(N,n,c1[i],c2,pi[,1],pi[,2],R1,R2)>=beta){
    n=n+1
  }
  print(n)
}
for (i in 1:11){
  while(consumerriskps(N,n,c1[i],c2,pi[,1],pi[,2],R1,R2)>=beta){
    n=n+1
  }
  print(n)
}
np6<-c(22,26,30,33,37,41,44,48,51,55,59)
np4<-c(18,22,26,30,33,37,41,44,48,52,56)
np1<-c(13,17,21,25,28,32,36,40,44,47,51)
np0<-c(12,15,19,23,27,30,34,38,42,46,49)
nps6<-c(22,25,27,31,34,38,43,48,52,57,62)
nps4<-c(18,21,24,28,33,38,43,47,52,57,62)
nps1<-c(13,18,22,28,33,37,42,47,52,57,62)
nps0<-c(12,17,22,27,32,37,42,47,52,57,62)

a1<-15
a2<-1
a3<-2
plot(c1,np1,ylim=c(10,65),type = "b",xlab="",axes= FALSE,ylab="Minimum sample size", family="serif"
     ,cex.lab=2,pch=a1,cex=a,col= 1,lwd=c)
points(c1,np4,pch=a2,type = "b",cex=a,col=1,lwd=c,lty=1)
points(c1,np6,pch=a3,type = "b",cex=a,col=1,lwd=c,lty=1)
points(c1,nps1,pch=a1,cex=a,col=1,type = "b",lwd=c,lty=3)
points(c1,nps4,pch=a2,cex=a,col=1,type = "b",lwd=c,lty=3)
points(c1,nps6,pch=a3,cex=a,col=1,type = "b",lwd=c,lty=3)
axis(2,cex.axis=1.5,lwd=c,pos=-0.3)
axis(1,at = seq(0,10,1),labels=c(0,1,2,3,4,5,6,7,8,9,10),cex.axis=1.5,lwd=c)
mtext(expression(c[1]), side=1, line=2.5,cex=2,at=10)
legend(7.5,35,bty = "n",legend=c(expression(I:c[2]==1),expression(I:c[2]==4),expression(I:c[2]==6),expression(II:c[2]==1),expression(II:c[2]==4),expression(II:c[2]==6)),lwd=3,cex=a,pch=c(a1,a2,a3,a1,a2,a3),col=c(1,1,1,1,1,1),lty = c(1,1,1,3,3,3))

