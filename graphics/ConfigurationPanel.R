library(shiny)

configuration_panel <- function() {
  verticalLayout(
    selectInput(
      inputId = "distribution_box",
      label = "Distribution",
      choices = c(
        "Uniform" = "uniform",
        "Normal" = "normal",
        "Poisson" = "poisson"
      )
    ),
    "Parameters:",
    conditionalPanel(
      condition = "input.distribution_box == 'uniform'",
      numericInput(inputId = "uMin", label = "Minimum", value = 0),
      numericInput(inputId = "uMax", label = "Maximum", value = 1)
    ),
    conditionalPanel(
      condition = "input.distribution_box == 'normal'",
      numericInput(inputId = "nMean", label = "Mean", value = 0),
      numericInput(inputId = "nStdev", label = "Standard Deviation", value = 1, min = 0.1)
    ),
    conditionalPanel(
      condition = "input.distribution_box == 'poisson'",
      numericInput(inputId = "pMean", label = "Mean", value = 1, min = 0.1)
    ),
    # div(
    #   div(numericInput(inputId = "count", label = "Generation Count", value = 1, min=1, max=1000), style = "display:inline-block"),
    #   div(actionButton(inputId = "generate_btn", label = "Generate"), style = "display:inline-block"),
    #   style = "width:100%"
    # ),
    div(
      div(numericInput(inputId = "count", label = "Generation Count", value = 1, min=1, max=1000)),
      div(actionButton(inputId = "generate_btn", label = "Generate"))
    )
  )
}
