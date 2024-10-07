import pandas as pd

df = pd.read_csv('https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv')

#print(df.head()) #Primeiros registros
# print(df.tail()) #Ultimos registros
 
#print(df.info()) #Identifica os tipos de dados
 
# df.set_index('PassengerId', inplace=True) #Muda o ID padrão para um já existente
# print(df.head(12))
 
# print(df.columns) #Nome de todas as colunas
 
# print(df.values) #feio
 
# print(df.loc[1]) #Pesquisa com todas as informações
 
# print(df.loc[[1, 2, 3]]) #Várias pesquisas de uma vez (Colocar em lista)

# print(df.loc[[1,2], ['Name', 'Sex', 'Age']]) #Pesquisa com colunas >> select x,y,z

# print(df.loc[10:20]) #Pesquisa de 10 a 20 >> where id < 20

# print(df.loc[10:20:2]) #Pesquisa de 10 a 20 pulando de 2 em 2

# print(df.loc[1:10], ['Name', 'Sex', 'Age']) #Pesquisa com intervalo e colunas específicas

# print(df.query('Age > 20').head()) #Select manual com query

# print(df.query('Age > 20 & Sex == "male"').head()) #Query com AND (&)

# print(df.query('Age > 20 | Sex == "male"').head()) #Query com OR (|)

df.to_csv('dataset.csv', sep=';', index=False, encoding='utf-8-sig')