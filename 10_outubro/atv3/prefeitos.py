import pandas as pd
import matplotlib.pyplot as plt

db_prefeitos = pd.read_csv('10_outubro/atv3/prefeitos.csv')

dados = db_prefeitos.loc[:, ['Candidato', 'Votos', 'Cidade']]

cg = []
tl = []
dr = []
cor = []
pp = [] 

for index, row in dados.iterrows():
    if row['Cidade'] == 'Campo Grande':
        cg.append(row[['Candidato', 'Votos']].to_dict())
    elif row['Cidade'] == 'Dourados':
        dr.append(row[['Candidato', 'Votos']].to_dict())
    elif row['Cidade'] == 'Três Lagoas':
        tl.append(row[['Candidato', 'Votos']].to_dict())
    elif row['Cidade'] == 'Corumbá':
        cor.append(row[['Candidato', 'Votos']].to_dict())
    elif row['Cidade'] == 'Ponta Porã':
        pp.append(row[['Candidato', 'Votos']].to_dict())

def plot_votos(cidade, candidatos):
    nomes = [item['Candidato'] for item in candidatos]
    votos = [item['Votos'] for item in candidatos]

    indice_maior = votos.index(max(votos))

    plt.figure(figsize=(8, 5))
    bars = plt.bar(nomes, votos, color='skyblue')

    bars[indice_maior].set_color('orange')

    plt.title(f'Distribuição de Votos em {cidade}', fontsize=16, fontweight='bold')
    plt.xlabel('Candidatos', fontsize=12)
    plt.ylabel('Quantidade de Votos', fontsize=12)
    plt.xticks(rotation=45)

    plt.tight_layout()
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    
plot_votos('Ponta Porã', pp)
plot_votos('Corumbá', cor)
plot_votos('Três Lagoas', tl)
plot_votos('Dourados', dr)
plot_votos('Campo Grande', cg)

plt.show()


