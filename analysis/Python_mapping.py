# Python code for bubble map with basemap

import pandas as pd
import folium

# Load dataset
file_path = r"C:/Users/Asus/OneDrive/Desktop/ENV_EPI_SEMINAR/data/CarmelMC_LungCancer.xlsx"
data = pd.read_excel(file_path, sheet_name="Sheet1")

# Aggregate by locality
agg = data.groupby(["locality", "latitude", "longitude"]).size().reset_index(name="count")

# Create base map
m = folium.Map(location=[32.8, 35.0], zoom_start=9, tiles="CartoDB positron")

# Add circles
for _, row in agg.iterrows():
    folium.CircleMarker(
        location=[row["latitude"], row["longitude"]],
        radius=row["count"]*1.5,
        popup=row["locality"],
        color="blue", fill=True, fill_opacity=0.6
    ).add_to(m)

# Save map as HTML
m.save("Figure_3.2.4.html")
