library(testthat)

context("Can read input.")



test_that("output contains the list of zips songs for 4 rows", {
  input <- "
    4 2
    30 one
    30 two
    15 three
    25 four
  "

  output <- as.data.frame(read.table(header = FALSE, text = "
      four
      two
    "))
  
  names(output) <- c("names")
    
  expect_that(get_zips_songs_list(input), equals(output))
})


context ("Complex example")

input <- "
    15 3
    197812 re_hash
    78906 5_4
    189518 tomorrow_comes_today 
    39453 new_genious
    210492 clint_eastwood
    26302 man_research
    22544 punk
    19727 sound_check
    17535 double_bass
    18782 rock_the_house
    198189 19_2000
    13151 latin_simone
    12139 starshine
    11272 slow_country
    10521 m1_a1
  "

test_that("output contains the list of zips songs for 14 rows", {
  output <- as.data.frame(read.table(header = FALSE, text = "
    19_2000
    clint_eastwood
    tomorrow_comes_today
  "))
  expect_that(get_zips_songs_list(input), equals(output))
})



test_that("can read the number of result list", {
  
  expect_that(get_number_of_result_list(input), equals(3))
})



test_that("can read the input without first row", {
  output <- as.data.frame(read.table(header = FALSE, text = "
    197812 re_hash
    78906 5_4
    189518 tomorrow_comes_today 
    39453 new_genious
    210492 clint_eastwood
    26302 man_research
    22544 punk
    19727 sound_check
    17535 double_bass
    18782 rock_the_house
    198189 19_2000
    13151 latin_simone
    12139 starshine
    11272 slow_country
    10521 m1_a1
  "))
  
  expect_that(read_input_into_dataframe(input), equals(output))
})
