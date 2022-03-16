# Import data
data = read.csv(here::here("Data","data_raw","StudentsPerformance.csv"))

# Rename columns names
names(data) <- c('gender', 'ethnicity',	'parent_education', 'lunch', 'pre', 'math', 'reading', 'writing')

# Export data into data folder
write.csv(data, 
          here::here("Data","data","StudentsPerformance_renamed.csv"))