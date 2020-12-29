import glob
import pandas as pd
import os

headers = ["application", "bandwidth", "burst", "bid", "type", "deposit", "addr", "key"]


if __name__ == "__main__":
    df = pd.DataFrame(columns=headers)
    files = glob.glob('private/*')
    
    files.remove('private/0x0671a40872727Ff3c610DD287e88c5b3672A6b30')
    print(len(files))

    unlocks = ""

    for i in range(len(files)):
        

        f = files[i]
        addr = f[f.find('/')+1:]
        key = open(f, 'r').read()
        if i >= 50:
            os.remove('private/'+addr)
            os.remove('keystore/'+addr+'.json')
            continue
        unlocks += addr + ','
        
        df.loc[i] = [
            0, # application
            1, # bandwidth
            1, # burst
            1, # bid
            1, # type, 0 for dynamic, 1 for guarantee
            100000, # deposit
            addr, # address
            key # private key
        ]
    print(df.head())
    print(unlocks)
    df.to_csv('example.csv')
