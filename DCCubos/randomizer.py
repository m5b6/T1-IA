import os
import random
import sys

for i in range(40):
    n = random.randint(40, 80)
    j = 0
    path = sys.path[0]

    while True:
        filename = path + f"\\problemas\\problema{j}.txt"
        if not os.path.exists(filename):
            break
        j += 1

    block_ids = list(range(1, n+1))
    random.shuffle(block_ids)

    with open(filename, 'w') as f:
        sys.stdout = f

        print("tiempo(0..bound).")
        for block_id in block_ids:
            print("bloque(b{}).".format(block_id))

        print("lugar(mesa).")
        for block_id in block_ids:
            print("lugar(b{}).".format(block_id))

        print("sobre(b{},mesa,0).".format(block_ids[0]))
        for i in range(1, n):
            print("sobre(b{},b{},0).".format(block_ids[i], block_ids[i-1]))

        print("objetivo(T) :-")
        for i in range(1, n):
            print("    sobre(b{0},b{1},T),".format(block_ids[i], block_ids[i-1]))
        print("    sobre(b{},mesa,T).".format(block_ids[0]))

    sys.stdout = sys.__stdout__
    
    print(f"Saved to file {filename}")
