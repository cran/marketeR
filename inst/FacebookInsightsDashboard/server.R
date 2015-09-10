#-------------------------------------------------------------------------------
# server.R (marketeR) - made with <3 by fmikaelian
#-------------------------------------------------------------------------------

shinyServer(function(input, output) {

  #-----------------------------------------------------------------------------
  # Create a time serie plot with Facebook API data
  #-----------------------------------------------------------------------------

  output$plot <- renderPlot({

    # Get data from Facebook Graph API -----------------------------------------

    insights <- getInsights(object_id = input$object_ID,
                            token = input$token,
                            metric = input$metric,
                            period = input$period,
                            parms = sprintf("&since=%s&until=%s", input$startdate, input$enddate))

    # Clean data ---------------------------------------------------------------

    insights <- data.frame(insights$end_time, insights$value)
    insights$insights.end_time <- as.Date(insights$insights.end_time)

    # Save data to .xls format -------------------------------------------------

    write.xlsx(insights, "data.xls")

    # Define plot parameters ---------------------------------------------------

    title <- sprintf("Facebook_%s_%s_%s_%s",input$object_ID,
                     input$metric,
                     input$startdate,
                     input$enddate)

    insights_plot <-
      ggplot(insights, aes(x = insights.end_time, y = insights.value)) +
      ggtitle(title) +
      geom_line(size = 0.5, color = "red") +
      scale_x_date(labels = date_format("%d%b%Y"), breaks = date_breaks("day")) +
      scale_y_continuous(labels = comma) +
      theme_economist() +
      scale_colour_economist() +
      theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 10),
            axis.text.y = element_text(size = 10))

    # Save plot to .png format -------------------------------------------------

    ggsave("plot.png")
    insights_plot

  })

  #-----------------------------------------------------------------------------
  # Create a download data button
  #-----------------------------------------------------------------------------

    output$downloadData <- downloadHandler(

      filename = function() {
        paste("data-", Sys.Date(), ".xls", sep = "")
      },

      content = function(file) {
        file.copy("data.xls", file, overwrite = TRUE)
      }

    )

  #-----------------------------------------------------------------------------
  # Create download plot button
  #-----------------------------------------------------------------------------

  output$downloadPlot <- downloadHandler(

    filename = function() {
      paste("data-", Sys.Date(), ".png", sep = "")
    },

    content = function(file) {
      file.copy("plot.png", file, overwrite = TRUE)
    }

  )

})
