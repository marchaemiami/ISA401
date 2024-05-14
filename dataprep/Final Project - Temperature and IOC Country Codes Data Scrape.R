# ISA 401 - Final Project - Code for Weather Data Scraping

# scrape the data from the site
"https://en.wikipedia.org/wiki/List_of_countries_by_average_yearly_temperature" |> 
  rvest::read_html() |> 
  rvest::html_elements('.headerSort , td') |> 
  rvest::html_text2() -> temperatures_data

# make sure it is as a list for easy slicing
temperatures_data = as.list(temperatures_data)

# initialize an empty dataframe to hold the temperature data later
temperature_df = data.frame(
  Rank = c(),
  Country = c(),
  Temperature = c()
)

# loop through the data to seperate the list into a dataframe
for (i in seq(1, length(temperatures_data), by = 3)){
  rank <- temperatures_data[[i]]
  country <- temperatures_data[[i + 1]]
  temperature <- temperatures_data[[i+2]]
  
  # add the results to the temperature df
  temperature_df = rbind(temperature_df, data.frame(Rank = rank, Country = country,  Temperature = temperature))
}

# check the data
print(temperature_df)

temperature_df$Temperature <- gsub("(?<=[0-9-]),", ".", temperature_df$Temperature, perl = TRUE)


# check the data
print(temperature_df)

write.csv(temperature_df, file = "temperature_data", row.names = FALSE)

# now, we need to get the IOC codes for each country in the temperature dataset since they didn't come along with that information

# scrape the data from the site
"https://en.wikipedia.org/wiki/List_of_IOC_country_codes" |> 
  rvest::read_html() |> 
  rvest::html_elements('tr') |> 
  rvest::html_text2() -> country_codes

# make sure it is as a list for easy slicing
country_codes = as.list(country_codes)

country_codes

write.csv(country_codes, file = "country_codes.csv", row.names = FALSE)