import pandas as pd

df = pd.read_csv('https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv')

# # Quantas crianças abaixo de 10 anos sobreviveram?
# num_criancas = df.query('Age < 10 and Survived == 1')
# num_criancas.to_csv('num_kid_surv.csv', sep=';', index=False, encoding='utf-8-sig')
# num_criancas = df.query('Age < 10 and Survived == 1')['Survived'].count()
# print(num_criancas)

# # Quantas Mulheres sobreviveram? 
# num_mulheres = df.query('Sex == "female" & Survived == 1')
# num_mulheres.to_csv('num_wm_surv.csv', sep=';', index=False, encoding='utf-8-sig')
# num_mulheres = df.query('Sex == "female" & Survived == 1')['Survived'].count()
# print(num_mulheres)

# # Quantos Homens sobreviveram? 
# num_homens = df.query('Sex == "male" & Survived == 1')
# num_homens.to_csv('num_man_surv.csv', sep=';', index=False, encoding='utf-8-sig')
# num_homens = df.query('Sex == "male" & Survived == 1')['Survived'].count()
# print(num_homens)

# # Quantos idosos acima de 50 anos sobreviveram?
# num_idosos = df.query('Age > 50 & Survived == 1')
# num_idosos.to_csv('num_old_surv.csv', sep=';', index=False, encoding='utf-8-sig')
# num_idosos = df.query('Age > 50 & Survived == 1')['Survived'].count()
# print(num_idosos)

# # Quantas crianças abaixo de 12 anos do sexo feminino sobreviveram?
# num_kid_fem = df.query('Age < 12 & Sex == "female" & Survived == 1')
# num_kid_fem.to_csv('num_kid_fem.csv', sep=';', index=False, encoding='utf-8-sig')
# num_kid_fem = df.query('Age < 12 & Sex == "female" & Survived == 1')['Survived'].count()
# print(num_kid_fem)