
seqInput = raw_input("Enter the sequence - comma separated value: ")
seq = seqInput.split(",")
symbols = []
code = []
t = 1
for i in range(0,len(seq)):
    if seq[i] not in symbols:
        symbols.append(seq[i])
        code.append(t)
        t=t+1

seq = seqInput.replace(",","")

seqi = seq
m=0
n=1

Encode = ""

def check(s,e,st,sy):
    if st[s:e] in sy:
        return True
    else:
        return False

while n<len(seqi):
    if check(m,n,seqi,symbols) is True:
        print("is present "+seqi[m:n]+" "+str(n))
        n=n+1
    else:
        print("not present "+seqi[m:n]+" "+str(n))
        h = seqi[m:n]
        m = n-1
        n = m+1
        
        symbols.append(h)
        code.append(t)
        t=t+1
        kp = h[0:len(h)-1]
        idt = symbols.index(kp)
        Encode = Encode + str(code[idt])

kp = seqi[m:n]
idt = symbols.index(kp)
Encode = Encode + str(code[idt])

print("Printing Dictionary : ")
for i in range(0,len(symbols)):
    print ("Symbol : "+str(symbols[i]+" Code : "+str(code[i])))
    
print("Encode : " + Encode)

Decode = ""
g = int(Encode)
while g!=0:
    q = g%10
    g=g/10
    Decode = symbols[q-1] + Decode

print("Decode : " + Decode)