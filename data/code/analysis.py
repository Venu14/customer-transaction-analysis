import pandas as pd

# Load data
df = pd.read_csv("data/transactions.csv")

# Total transactions
print("Total Transactions:", len(df))

# Fraud transactions
fraud = df[df['is_fraud'] == 1]
print("Fraud Count:", len(fraud))

# High value transactions (>3000)
high_value = df[df['amount'] > 3000]
print("High Value Transactions:", len(high_value))

# Location-wise revenue
location_analysis = df.groupby('location')['amount'].sum()
print(location_analysis)
