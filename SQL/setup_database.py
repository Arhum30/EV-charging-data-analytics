import pandas as pd
import sqlite3

df = pd.read_csv("Data/Dataset 1_EV charging reports.csv", sep=";")
connection = sqlite3.connect("SQL/ev_charging.db")
# print(df.head())
# print(df.shape)
df.to_sql("charging_sessions", connection, index= False, if_exists="replace")

connection.close()