import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('10_outubro/atv2/all_seasons.csv')

df1 = df.loc[0:11145, ['player_height']]
df2 = df.loc[0:11145, ['player_weight']]

a = (1, 2, 3, 4, 5)
b = (1, 2, 3, 4, 5)

x = -1

# plt.plot([t**2 for t in range(5)], '#000000', linestyle='-', marker='.') # Linhas
# plt.scatter(df1, df2) # Dispersão
# plt.bar(a, b) # Barras
# plt.hist(a, b) # Barras coladas

# --- Pizza ---

# a = (10, 20, 30)
# explode = (0.1, 0, 0)
# labels = ['HB20', 'Gol', 'Fusca']
# plt.pie(a, explode=explode, labels=labels, autopct='%.2f%%', shadow=True)


salario_minimo = [
    280.00,  # 2000
    292.00,  # 2001
    300.00,  # 2002
    320.00,  # 2003
    350.00,  # 2004
    380.00,  # 2005
    400.00,  # 2006
    415.00,  # 2007
    430.00,  # 2008
    465.00,  # 2009
    510.00,  # 2010
    540.00,  # 2011
    622.00,  # 2012
    678.00,  # 2013
    724.00,  # 2014
    788.00,  # 2015
    880.00,  # 2016
    937.00,  # 2017
    954.00,  # 2018
    998.00,  # 2019
    1045.00, # 2020
    1100.00  # 2021
]

anos = list(range(2000, 2022))

plt.plot(anos, salario_minimo)

plt.grid(True)
plt.xlabel(u'Anos')
plt.ylabel(u'Salário Mínimo')
plt.title(u'Salário Míno de 2000 a 2021')
plt.show()