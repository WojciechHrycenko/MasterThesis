from pandas_datareader import wb
import pandas as pd

countries = [
    "POL", "CZE", "SVK", "HUN", "SVN", "EST", "LVA", "LTU", 
    "ROU", "BGR", "RUS", "UKR", "BLR", "KAZ"
]

# NE.CON.GOVT.ZS = General government final consumption expenditure (% of GDP)
# To jest jedyna seria, która sięga lat 1990-1992 dla regionu CEE/CIS w API
indicators = {
    "NE.CON.GOVT.ZS": "Gov_Consumption_Pct_GDP"
}

print("Pobieranie danych o wydatkach rządowych (% PKB)...")

try:
    df = wb.download(indicator=indicators, country=countries, start=1989, end=2005)
    
    df = df.reset_index()
    df['year'] = pd.to_numeric(df['year'])
    df = df.sort_values(['country', 'year'])
    
    # Zmiana nazwy kolumny na czytelną
    df.rename(columns=indicators, inplace=True)

    print("\n--- Podgląd danych ---")
    print(df.head(10))
    
    # Sprawdźmy, od którego roku realnie startują dane dla każdego kraju
    print("\n--- Pierwszy dostępny rok dla każdego kraju ---")
    valid_data = df.dropna()
    print(valid_data.groupby('country')['year'].min())

    df.to_csv("gov_expenditure_shock_data.csv", index=False)
    print("\nZapisano: gov_expenditure_shock_data.csv")

except Exception as e:
    print(f"Błąd: {e}")