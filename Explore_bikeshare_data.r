
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

# solution

ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')


# Load necessary libraries
library(ggplot2)


# Plot distribution of trip duration
ggplot(ny, aes(x = Trip.Duration)) +
  geom_histogram(binwidth = 60, fill = "blue", color = "black") +  # Bin width set to 60 seconds (1 minute)
  xlim(0, 3600) +  # Limit to 60 minutes for a clearer view
  labs(title = "Distribution of Trip Duration in New York City", x = "Trip Duration (seconds)", y = "Frequency")








# solution

library(ggplot2)

ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

# Convert Start.Time to POSIXct
ny$Start.Time <- as.POSIXct(ny$Start.Time, format="%Y-%m-%d %H:%M:%S")
wash$Start.Time <- as.POSIXct(wash$Start.Time, format="%Y-%m-%d %H:%M:%S")
chi$Start.Time <- as.POSIXct(chi$Start.Time, format="%Y-%m-%d %H:%M:%S")

# Extract the day of the week
ny$DayOfWeek <- weekdays(ny$Start.Time)
wash$DayOfWeek <- weekdays(wash$Start.Time)
chi$DayOfWeek <- weekdays(chi$Start.Time)

# Aggregate data
ny_day_counts <- as.data.frame(table(ny$DayOfWeek))
wash_day_counts <- as.data.frame(table(wash$DayOfWeek))
chi_day_counts <- as.data.frame(table(chi$DayOfWeek))

# Add city column
ny_day_counts$City <- "New York"
wash_day_counts$City <- "Washington"
chi_day_counts$City <- "Chicago"

# Combine data frames
all_day_counts <- rbind(ny_day_counts, wash_day_counts, chi_day_counts)

# Rename columns for clarity
colnames(all_day_counts) <- c("DayOfWeek", "Count", "City")

# Ensure the days of the week are ordered correctly
all_day_counts$DayOfWeek <- factor(all_day_counts$DayOfWeek, 
                                   levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# Plot the data
ggplot(all_day_counts, aes(x = DayOfWeek, y = Count, fill = City)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Number of Trips by Day of the Week for Each City", x = "Day of the Week", y = "Number of Trips") +
  scale_fill_manual(values = c("New York" = "blue", "Washington" = "green", "Chicago" = "red")) +
  theme_minimal()





# Your solution code goes here

ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

# Count the number of trips per start station
wash_start_station_counts <- as.data.frame(table(wash$Start.Station))

# Rename columns for clarity
colnames(wash_start_station_counts) <- c("Start.Station", "Count")

# Sort the data frame by the count in descending order
wash_start_station_counts <- wash_start_station_counts[order(-wash_start_station_counts$Count), ]

# Load necessary library
library(ggplot2)

# Plot the data (Top 20 start stations)
ggplot(wash_start_station_counts[1:20, ], aes(x = reorder(Start.Station, Count), y = Count)) +
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  coord_flip() +
  labs(title = "Top 20 Start Stations in Washington", x = "Start Station", y = "Number of Trips") +
  theme_minimal()


system('python -m nbconvert Explore_bikeshare_data.ipynb')
