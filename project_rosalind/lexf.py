def combina(alfabeto,n,kmer,lista):
    if n==0:
        lista.append(kmer)
    else:
        for letra in alfabeto:
            combina(alfabeto,n-1,kmer+letra,lista)
    return lista

"""
file = open( "/mnt/B21AA1BD1AA17ECB/downloads_chromium_ubuntu/rosalind_lexf.txt" )
alfabeto = file.readline().split()
n = int(file.readline())
file.close()
"""

###Exemplo
alfabeto=['a','c','g','t']
n=2


print "Número de possibilidades: "+str(len(alfabeto)**n)

resposta= combina(alfabeto,n,'',[])

for i in resposta:
    print i



    


