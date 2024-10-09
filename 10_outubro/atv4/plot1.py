import matplotlib.pyplot as plt
import pandas as pd

db = pd.read_csv('10_outubro/atv4/db/pokemon.csv')

#-------------- Relação Ataque defesa --------------

# attack = db.loc[:, ['Attack']]
# defense = db.loc[:, ['Defense']]

# plt.scatter(attack, defense)
# plt.title('Relação entre Ataque e Defesa dos Pokémon')
# plt.xlabel('Ataque')
# plt.ylabel('Defesa')
# plt.show()

#-------------- Relação defesa e peso

# attack = db.loc[:, ['Defense']]
# defense = db.loc[:, ['Weight']]

# plt.scatter(attack, defense)
# plt.title('Relação entre Defesa e Peso dos Pokémon')
# plt.xlabel('Defesa')
# plt.ylabel('Peso')
# plt.show()

#-------------- Porcentagem tipos unicos

# tipos = db['Type'].value_counts()
# tu = []

# for i in tipos.index:
#     if ' ' not in i:
#         tu.append(i)

# tipos_unico = tipos[tipos.index.isin(tu)]

# plt.pie(tipos_unico, labels=tipos_unico.index, autopct='%1.1f%%', startangle=140)
# plt.title('Distribuição de Tipos de Pokémon (Apenas Um Tipo)')
# plt.axis('equal')
# plt.show()

#-------------- Menor chance de captura

# captura_por_tipo = db.groupby('Name')['Catch rate'].mean().sort_values()
# captura_por_tipo = captura_por_tipo[50:]

# bottom_tipos = captura_por_tipo.head(50)

# plt.figure(figsize=(10, 6))
# plt.barh(bottom_tipos.index, bottom_tipos.values, color='salmon')
# plt.title('Top 50 Tipos com Menor Taxa de Captura')
# plt.xlabel('Taxa de Captura')
# plt.ylabel('Nome')
# plt.show()

#-------------- Maior chance de captura

# captura_por_tipo = db.groupby('Name')['Catch rate'].mean().sort_values()
# captura_por_tipo = captura_por_tipo[900:950]

# bottom_tipos = captura_por_tipo.tail(50)

# plt.figure(figsize=(10, 6))
# plt.barh(bottom_tipos.index, bottom_tipos.values, color='salmon')
# plt.title('Top 50 Tipos com Maior Taxa de Captura')
# plt.xlabel('Taxa de Captura')
# plt.ylabel('Nome')
# plt.show()
