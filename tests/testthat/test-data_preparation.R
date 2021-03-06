# data_preparation ----
test_that("data_preparation works as expected", {
  working_dir <- tempdir(check = TRUE)
  data_path <- file.path(working_dir, "trial_example.csv")
  data.table::fwrite(trial_example, data_path)

  result <- data_preparation(
    data_path = data_path,
    data_dir = working_dir,
    id="id",
    period = "period",
    eligible = "eligible",
    treatment = "treatment",
    outcome = "outcome",
    model_var = "assigned_treatment",
    outcomeCov_var = c("catvarA", "catvarB", "catvarC","nvarA","nvarB","nvarC"),
    numCores = 1
  )

  expect_file_exists(result$absolutePath)
  expect_identical(result$N, 1939053)
  expect_identical(result$range, 396)
  expect_identical(result$min_period, 1L)
  expect_identical(result$max_period, 396L)

  result_data <- fread(result$absolutePath)
  expect(nrow(result_data), result$N)

  result_pat_1 <- as.data.frame(result_data[result_data$id == 1, ])
  expected_pat_1 <- vignette_switch_data[vignette_switch_data$id == 1, ]
  expect_identical(result_pat_1, expected_pat_1)

  unlink(working_dir)
})

# data_preparation ----
test_that("data_preparation can be quiet", {
  working_dir <- tempdir(check = TRUE)
  data_path <- file.path(working_dir, "trial_example.csv")
  data.table::fwrite(trial_example, data_path)

  expect_silent(
    result <- data_preparation(
      data_path = data_path,
      data_dir = working_dir,
      id="id",
      period = "period",
      eligible = "eligible",
      treatment = "treatment",
      outcome = "outcome",
      model_var = "assigned_treatment",
      outcomeCov_var = "catvarA",
      first_period = 1,
      last_period = 5,
      numCores = 1,
      quiet = TRUE
    )
  )
})
