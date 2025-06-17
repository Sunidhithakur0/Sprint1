import json
import pandas as pd

# Step 1: Load the raw moodlogs JSON file
with open("moodlogs_raw.json", "r") as f:
    data = json.load(f)

# Step 2: Add mood_id to each record
for i, record in enumerate(data, start=1):
    record["mood_id"] = i

# Step 3: Create a DataFrame and reorder columns
df = pd.DataFrame(data)
df.rename(columns={"date": "mood_date"}, inplace=True)
df = df[["mood_id", "user_id", "mood_rating", "mood_notes", "mood_date"]]

# Step 4: Save to CSV
df.to_csv("moodlogs_cleaned.csv", index=False)
print("✅ moodlogs_cleaned.csv file created successfully.")
