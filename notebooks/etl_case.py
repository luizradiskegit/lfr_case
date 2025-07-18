from pyspark.sql import SparkSession
import os

spark = SparkSession.builder \
    .appName("case") \
    .getOrCreate()

jdbc_url = f"jdbc:postgresql://{os.getenv('POSTGRES_HOST')}:{os.getenv('POSTGRES_PORT')}/{os.getenv('POSTGRES_DB')}"
properties = {
    "user": os.getenv("POSTGRES_USER"),
    "password": os.getenv("POSTGRES_PASSWORD"),
    "driver": "org.postgresql.Driver"
}
output_path = os.getenv("CSV_OUTPUT_PATH", "/opt/spark/data/output/movimento_flat")

#leitura das tabelas do Postgres
df_associado = spark.read.jdbc(jdbc_url, "associado", properties=properties)
df_conta = spark.read.jdbc(jdbc_url, "conta", properties=properties)
df_cartao = spark.read.jdbc(jdbc_url, "cartao", properties=properties)
df_mov = spark.read.jdbc(jdbc_url, "movimento", properties=properties)

#Criação de tempviews para spark sql
df_associado.createOrReplaceTempView("associado")
df_conta.createOrReplaceTempView("conta")
df_cartao.createOrReplaceTempView("cartao")
df_mov.createOrReplaceTempView("movimento")

#dataframe final fazendo o desafio da estrutura movimento_flat (nesse caso salvando em um csv local)

##IMPORTANTE
#O campo data_criacao_cartao não estava presente na tabela cartao do diagrama fornecido. Por isso, optei por manter a consistência com o modelo original e não incluí essa informação na movimento_flat
df_final = spark.sql("""
    SELECT a.nome as nome_associado,
          a.sobrenome as sobrenome_associado,
          a.idade as idade_associado,
          m.vlr_transacao as vlr_transacao_movimento,
          m.des_transacao as des_transacao_movimento,
          m.data_movimento,
          ca.num_cartao as numero_cartao,
          ca.nom_impresso as nome_impresso_cartao,
          c.tipo as tipo_conta,
          c.data_criacao as data_criacao_conta
                                                                                      
    FROM associado a
    INNER JOIN conta c ON a.id = c.id_associado
    LEFT JOIN cartao ca ON a.id = ca.id_associado
    LEFT JOIN movimento m ON ca.id = m.id_cartao
""")

os.makedirs(output_path, exist_ok=True)

#Salva em csv na pasta 
df_final.write.mode("overwrite").option("header", "true").csv(output_path)
