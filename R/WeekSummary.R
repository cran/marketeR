#-------------------------------------------------------------------------------
# WeekSummary.R (marketeR) - made with <3 by fmikaelian
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#' @title A report of your website performance during the past 7 days
#' @description \code{WeekSummary} is a quick way to check how your website
#'   performed during the past 7 days, compared to your past scores.
#' @param metrics A list of comma-separated metrics, such as \code{ga:metrics}.
#' @param table.id The unique table ID of the form ga:XXXX, where XXXX is the
#'   Analytics view (profile) ID for which the query will retrieve the data.
#' @param export If the export option is set as "TRUE", both raw data & 
#'   graphics will be exported in the current working directory. Otherwise,
#'   R will only print raw data and display a visualization of the week summary.
#' @note The triangles are representing the results of the past 7 days.
#'   Their color may vary according to the mean (green is > mean, red is < mean).
#'   The mean is represented by the letter \code{m}.
#' @examples \dontrun{
#' WeekSummary(metrics = "ga:sessions", table.id = "ga:XXXXXXX", export = FALSE)}
#' @export
#-------------------------------------------------------------------------------

WeekSummary <- function(metrics, table.id, export = FALSE) {

  #-----------------------------------------------------------------------------
  # Get past.data from Google Analytics Core Reporting API
  #-----------------------------------------------------------------------------

  query.list <- Init(start.date = as.character(Sys.Date() - 372),
                     end.date = as.character(Sys.Date() - 1),
                     metrics = metrics,
                     dimensions = "ga:week, ga:dayOfWeek",
                     table.id = table.id
                     )

  ga.query <- QueryBuilder(query.list)
  past.data <- GetReportData(ga.query, token)

  #-----------------------------------------------------------------------------
  # Get current.data from Google Analytics Core Reporting API
  #-----------------------------------------------------------------------------

  query.list <- Init(start.date = as.character(Sys.Date() - 7),
                     end.date = as.character(Sys.Date() - 1),
                     metrics = metrics,
                     dimensions = "ga:week, ga:dayOfWeek",
                     table.id = table.id
                     )

  ga.query <- QueryBuilder(query.list)
  current.data <- GetReportData(ga.query, token)

  #-----------------------------------------------------------------------------
  # Clean data
  #-----------------------------------------------------------------------------

  # Get the means for past.data ------------------------------------------------

  past.data <-
  past.data %>%
    group_by(dayOfWeek) %>%
    dplyr::summarise(mean(sessions))

  # Put current.data at the right format ---------------------------------------

  current.data <-
  current.data %>%
    select(dayOfWeek, sessions) %>%
    arrange(dayOfWeek)

  # Merge past.data & current.data to create final.data ------------------------

  dates.list <- list()

  for (i in 1:7) {
    
    dates.list[[i]] <- c(as.character(Sys.Date() - i),
                         as.POSIXlt(Sys.Date() - i)$wday)
  }

  dates.df <- as.data.frame(do.call(rbind, dates.list))
  dates.df <- arrange(dates.df, V2)

  final.data <- bind_cols(current.data, past.data, dates.df)
  
  colnames(final.data) <- c("DayOfWeek",
                            "sessions",
                            "DayOfWeek2",
                            "mean",
                            "dates",
                            "DayOfWeek3")
  
  final.data <- select(final.data, dates, mean, sessions)
  final.data <- mutate(final.data, new_dates = paste(dates, weekdays(as.Date(dates))))

  #-----------------------------------------------------------------------------
  # Create plot of final.data
  #-----------------------------------------------------------------------------

  final.plot <-
    ggplot(final.data, aes(x = new_dates, y = mean, ymin = 0)) +
    ggtitle(paste("WeekSummary - ", Sys.Date() - 7, " / ", Sys.Date() -1, sep = "")) +
    xlab("Date") +
    ylab("Sessions") +
    geom_point(size = 4, shape = 109) +
    geom_point(data = final.data, aes(x = new_dates, y = sessions, colour  =  sessions > mean), shape = 17, size = 6) +
    scale_y_continuous(labels = comma) +
    scale_colour_manual(values = setNames(c("green","red"), c(T, F))) +
    theme_bw() +
    theme(legend.position="none")

  plot(final.plot)
  
  #-----------------------------------------------------------------------------
  # Export data
  #-----------------------------------------------------------------------------
  
  if (export == TRUE) {
    write.xlsx(final.data[1:3], "WeekSummary_data.xls")
    ggsave("WeekSummary_plot.png", final.plot, width = 14, height = 8)
    }

}
