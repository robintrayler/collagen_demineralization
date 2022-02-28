# paratethys - all miocene
 temp range
min = 10
max = 26

# water mean and sd
water_mu <- -0.5
water_sig <- 0.5

| temperature_mean| temperature_sd| d18Ow_mean| d18Ow_sd| sigma_mean| sigma_sd|
|----------------:|--------------:|----------:|--------:|----------:|--------:|
|           17.805|          2.205|      -0.47|    0.507|      1.413|    0.071|



# Miocene South Atlantic

sharks <- read_csv(file = './Data/meg_project_data.csv') %>% 
  filter(age == 'Miocene' & Basin == "South Atlantic")

# temp range
min = 12
max = 27

# water mean and sd
water_mu <- -0.5
water_sig <- 0.5

| temperature_mean| temperature_sd| d18Ow_mean| d18Ow_sd| sigma_mean| sigma_sd|
|----------------:|--------------:|----------:|--------:|----------:|--------:|
|           23.895|          1.783|       -0.6|    0.411|      0.697|    0.051|


# Miocene South Pacific
# temp range
min = 12
max = 27

# water mean and sd
water_mu <- -0.5
water_sig <- 0.5


| temperature_mean| temperature_sd| d18Ow_mean| d18Ow_sd| sigma_mean| sigma_sd|
|----------------:|--------------:|----------:|--------:|----------:|--------:|
|           15.754|          1.943|     -0.378|    0.433|      1.086|    0.121|


# East Pacific Miocene
sharks <- read_csv(file = './Data/meg_project_data.csv') %>% 
  filter(age == 'Miocene' & Basin == "East Pacific") %>% 
  filter(!is.na(d18Op))

# temp range
min = 5
max = 27

# water mean and sd
water_mu <- -0.5
water_sig <- 0.5

| temperature_mean| temperature_sd| d18Ow_mean| d18Ow_sd| sigma_mean| sigma_sd|
|----------------:|--------------:|----------:|--------:|----------:|--------:|
|           15.273|          3.077|     -0.466|    0.487|      1.285|    0.551|