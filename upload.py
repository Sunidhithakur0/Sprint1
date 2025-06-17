import pandas as pd
from sqlalchemy import create_engine

host = 'localhost'
port = 3306
user = 'your_username'
password = 'your_password'
database = 'healthtracker'

engine = create_engine(f"mysql+mysqlconnector://{user}:{password}@{host}:{port}/{database}", echo=False)

activitylogs = pd.read_csv('activitylogs_cleaned.csv')
dietlogs = pd.read_csv('dietlogs_cleaned.csv')
moodlogs = pd.read_csv('moodlogs_cleaned.csv')
users = pd.read_csv('users_cleaned.csv')
regions = pd.read_csv('regions_cleaned.csv')
wearable = pd.read_csv('wearable_cleaned.csv')

activitylogs.to_sql('activitylogs', con=engine, if_exists='replace', index=False)
dietlogs.to_sql('dietlogs', con=engine, if_exists='replace', index=False)
moodlogs.to_sql('moodlogs', con=engine, if_exists='replace', index=False)
regions.to_sql('regions', con=engine, if_exists='replace', index=False)
users.to_sql('users', con=engine, if_exists='replace', index=False)
wearable.to_sql('wearabledata', con=engine, if_exists='replace', index=False)

print("✅ All data uploaded successfully to MySQL!")
