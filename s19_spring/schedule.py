import numpy as np

home = {}
f = open('schedule.csv', 'r')
for l in f:
    a = l.strip().split()

    b = {}
    r = {}
    for x in a:
        if x[1] == 'B':
            t1 = int(x[0])
            t2 = int(a[t1 - 1][0])
            if t1 not in b and t2 not in b:
                if t2 in home.get(t1, set()):
                    h = t2
                elif t1 in home.get(t2, set()):
                    h = t1
                else:
                    h = np.random.choice([t1, t2])
                b[h] = t1 + t2 - h
                home.setdefault(h, set()).add(t1 + t2 - h)
        else:
            t1 = int(x[0])
            t2 = int(a[t1 - 1][0])
            if t1 not in r and t2 not in r:
                if t2 in home.get(t1, set()):
                    h = t2
                elif t1 in home.get(t2, set()):
                    h = t1
                else:
                    h = np.random.choice([t1, t2])
                r[h] = t1 + t2 - h
                home.setdefault(h, set()).add(t1 + t2 - h)


    print('Billi:', b, 'Breeze', r)
