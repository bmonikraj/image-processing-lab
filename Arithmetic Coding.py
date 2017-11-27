# -*- coding: utf-8 -*-

#Encoding in Arithmetic Coding
def ara(b,e,symbol,prob,s):
    newProb = [b]
    for i in range(0,len(prob)):
        last = newProb[len(newProb)-1]
        newProb.append(prob[i]*(e-b)+last)
    p=0
    for j in range(0,len(symbol)):
        if(s==symbol[j]):
            p=j
    print("Symbol is : "+str(s))
    print("Range is " + str(p) + " and " + str(p+1))
    return newProb[p], newProb[p+1]


symbol = []
prob = []
n = input("Number of symbols : ")
for i in range(0,n):
    a = raw_input("Enter Symbol :")
    b = input("Enter Probability :")
    symbol.append(a)
    prob.append(b)

msg = raw_input("Enter the message as comma separated value : ")

msgList = msg.split(",")

m=0
n=1
for k in range(0,len(msgList)):
    m,n = ara(m,n,symbol,prob,msgList[k])

Encode = (m+n)/2
print("Encode : "+str(Encode))

#Decoding of Encoded in Arithmetic code
cuProb = [0]
lp = 0
for i in range(0,len(symbol)):
    cuProb.append(prob[i]+lp)
    lp = cuProb[len(cuProb)-1]

d = ""
hk = Encode
for i in range(0,len(msgList)):
    r = 0
    for j in range(0,len(cuProb)-1):
        if hk >= cuProb[j] and hk < cuProb[j+1]:
            r = j
    d = d + symbol[r]
    hk = (hk-cuProb[r])/(cuProb[r+1]-cuProb[r])

print("The decode word is : "+str(d))    