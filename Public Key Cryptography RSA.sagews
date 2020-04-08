︠5b0f0a93-335f-458a-bc57-1a64c3613543︠
%md
# Project 11: Public Key Cryptography

## Jony Karki
︡678de94f-c276-45b7-92c8-38b328282a49︡{"done":true,"md":"# Project 11: Public Key Cryptography\n\n## Jony Karki"}
︠a0e7f665-eb39-45ad-8feb-5f9712f474a1s︠
# Problem 1
def gen_kid_rsa(a,b,a_,b_):
    M = (abs(a)*abs(b))-1
    e = (abs(a_)*M)+abs(a)
    d = (abs(b_)*M)+abs(b)
    n = ((e*d)-1)/M
    public_key = (n,e)
    private_key = (n,d)
    return public_key, private_key

gen_kid_rsa(5,25,7,-49)
︡90926846-31e8-4410-aa04-19dbc2f16a0c︡{"stdout":"((42953, 873), (42953, 6101))\n"}︡{"done":true}
︠f0fdf586-bb9c-42cc-a82d-bd29d4ffc56cs︠
# Problem 2
def encode_plaintext(msg, public_key):
    int_msg = map(ord,msg)
    (n,e) = public_key
    enc_msg = [(value*e)%n for value in int_msg]
    return enc_msg

def decode_plaintext(msg, private_key):
    (n,d) = private_key
    chr_msg = [((c*d)%n) for c in msg]
    return "".join(map(chr, chr_msg))

encode_plaintext("Hello World!", (18727681775633924267183, 299056986392375))
decode_plaintext([21532103020251000, 30204755625629875, 32298154530376500, 32298154530376500, 33195325489553625, 9569823564556000, 26017957816136625, 33195325489553625, 34092496448730750, 32298154530376500, 29905698639237500, 9868880550948375], (18727681775633924267183, 343412949245738779))
︡46b0615f-d198-4347-9af9-52542a803958︡{"stdout":"[21532103020251000, 30204755625629875, 32298154530376500, 32298154530376500, 33195325489553625, 9569823564556000, 26017957816136625, 33195325489553625, 34092496448730750, 32298154530376500, 29905698639237500, 9868880550948375]\n"}︡{"stdout":"'Hello World!'\n"}︡{"done":true}
︠b2690921-8daf-4a78-a2df-dddae8b774cfs︠
# Problem 3
def private_RSA_key(public_key):
    n = public_key[0]
    e = public_key[1]

    gcd_list = []
    rem = 1
    while rem !=0:
        a = int(n/e)
        b = n/(n/e)
        rem = n%e
        gcd_list.append([a,b,rem])
        n = b
        e = rem

    p,q,r,s = 0,1,0,0
    for i in range(len(gcd_list)-1):
        r = gcd_list[i][0]
        s = (p-(q*r))%public_key[0]
        p = q
        q = s

    private_key = (public_key[0],s)
    return private_key

private_RSA_key((296752082371986041239, 2060778349803809))
︡38686b90-1d73-4eea-9062-c95f1446c1b6︡{"stdout":"(296752082371986041239, 7065525741017655839)\n"}︡{"done":true}
︠f159689b-d68f-4517-9b18-5df0f5eb4cc4︠










