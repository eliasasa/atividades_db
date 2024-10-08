import pandas as pd
import matplotlib.pyplot as plt

db_vereadores = pd.read_csv('10_outubro\\atv3\\vereadores.csv')

nomes = db_vereadores['Candidato']
votos = db_vereadores['Votos']
indice_maior = votos.idxmax()

plt.figure(figsize=(10, 6)) # Tamanho ao iniciar
bars = plt.bar(nomes, votos, color='skyblue')

bars[indice_maior].set_color('orange')

plt.title('Distribuição de Votos por Candidato', fontsize=16, fontweight='bold')
plt.xlabel('Candidatos', fontsize=12)
plt.ylabel('Quantidade de Votos', fontsize=12)

plt.xticks(rotation=45, ha='right')
plt.tight_layout()
plt.show()
