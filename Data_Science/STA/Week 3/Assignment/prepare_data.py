import pandas as pd

# Load data from CSV files
df1 = pd.read_csv('Data_Science/STA/Week 3/Assignment/Radardata.csv')
df2 = pd.read_csv('Data_Science/STA/Week 3/Assignment/cn-airports.csv', encoding='UTF-8-sig')

# Create a dictionary mapping airport identifiers to their coordinates (longitude, latitude)
airport_coords = df2.set_index('ident')[['longitude_deg', 'latitude_deg']].to_dict(orient='index')

# Initialize lists for origin and destination coordinates
o_longtitude = []
o_latitude = []
d_longtitude = []
d_latitude = []

# Iterate over df1 and perform fast dictionary lookup
for i in range(len(df1)):
    o_airport = df1.iloc[i]['depart airport']
    d_airport = df1.iloc[i]['landing airport']

    # Look up coordinates in the dictionary, use None if not found
    o_coords = airport_coords.get(o_airport, {'longitude_deg': None, 'latitude_deg': None})
    d_coords = airport_coords.get(d_airport, {'longitude_deg': None, 'latitude_deg': None})

    # Append coordinates to lists
    o_longtitude.append(o_coords['longitude_deg'])
    o_latitude.append(o_coords['latitude_deg'])
    d_longtitude.append(d_coords['longitude_deg'])
    d_latitude.append(d_coords['latitude_deg'])

# Add new columns to df1 with the collected coordinates
df1['o_longtitude'] = o_longtitude
df1['o_latitude'] = o_latitude
df1['d_longtitude'] = d_longtitude
df1['d_latitude'] = d_latitude

# Save the updated DataFrame to a new CSV file
df1.to_csv('Data_Science\STA\Week 3\Assignment\prepared_airflow_data.csv', index=False)
