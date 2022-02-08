dat_bfi <- psychTools::bfi |> 
  rownames_to_column(var = ".id")

dat_bfi |>
  mutate(
    gender = recode(gender, "1" = "man", "2" = "woman")  #Get a vector and replace value
  ) |>
  select(.id, gender, education) |>
  head()

glimpse(dat_bfi) #Show all the columns

dat_bfi |>
  mutate(
    gender = recode(gender, "1"="man", "2"="woman")
  ) |>
  glimpse()

recode(c(1,2,3,4, NA, 100), "1"="man", "2"="woman",
       .default = "not a binary", .missing = "not reported")  # .default and .missing args in recode func.

dat_bfi |>
  group_by(gender) |>
  summarize(
    across(     # Instead of calling each column one by one, across will be useful!
      A1:A5,
      mean,
      na.rm = TRUE
    )
  )