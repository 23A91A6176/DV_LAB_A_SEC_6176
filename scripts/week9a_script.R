install.packages("leaflet")
library(leaflet)

# Data
cities <- data.frame(
  name = c("Delhi","Mumbai","Chennai","Kolkata"),
  lat = c(28.6139,18.9582,13.0827,22.5744),
  lng = c(77.2088,72.8321,80.2707,88.3629),
  pop = c(30,20,11,15)
)


pal <- colorNumeric("Reds", cities$pop)

# 1. Basic Map
leaflet() %>% addTiles()

# 2. Map with Marker
leaflet() %>%
  addTiles() %>%
  addMarkers(lng = 77.2088, lat = 28.6139, popup = "Delhi")

# 3. Multiple Markers
leaflet(cities) %>%
  addTiles() %>%
  addMarkers(~lng, ~lat, popup = ~name)

# 4. Circle Markers
leaflet(cities) %>%
  addTiles() %>%
  addCircleMarkers(~lng, ~lat, radius = ~pop, color = "blue")

# 5. Color Map with Legend
leaflet(cities) %>%
  addTiles() %>%
  addCircleMarkers(~lng, ~lat, radius = ~pop, color = ~pal(pop)) %>%
  addLegend("bottomright", pal = pal, values = ~pop, title = "Population")

