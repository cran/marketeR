#-------------------------------------------------------------------------------
# PerformanceForecast.R (marketeR) - made with <3 by fmikaelian
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#' @title A prediction of your website performance using auto-ARIMA model
#' @description \code{PerformanceForecast} is a quick way to predict how your
#'   website will perform in the next 12 months based on your past scores.
#' @param start.date Start date for fetching Analytics data. Requests can
#'   specify a start date formatted as YYYY-MM-DD, or as a relative date
#'   (e.g., today, yesterday, or NdaysAgo where N is a positive integer).
#' @param end.date End date for fetching Analytics data. Request can specify
#'   an end date formatted as YYYY-MM-DD, or as a relative date (e.g., today,
#'   yesterday, or NdaysAgo where N is a positive integer).
#' @param metrics A list of comma-separated metrics, such as \code{ga:metrics}.
#' @param table.id The unique table ID of the form ga:XXXX, where XXXX is the
#'   Analytics view (profile) ID for which the query will retrieve the data.
#' @param export If the export option is set as "TRUE", both raw data & 
#'   graphics will be exported in the current working directory. Otherwise,
#'   R will only print raw data and display a visualization of the forecast.
#' @note The black part is the past website traffic data; the blue part is the
#'   graphical representation of the forecast, with Lo 80/Lo 95 & Hi 80/Hi 95.
#' @examples \dontrun{
#'   PerformanceForecast(start.date = "2007-02-01", end.date ="2015-06-30", 
#'   metrics = "ga:sessions", table.id = "ga:XXXXXXX", export = FALSE)}
#' @export
#-------------------------------------------------------------------------------

PerformanceForecast <- function(start.date, end.date, metrics, table.id, export = FALSE) {

  #-----------------------------------------------------------------------------
  # Get past.data from Google Analytics Core Reporting API
  #-----------------------------------------------------------------------------

  query.list <- Init(start.date = start.date,
                     end.date = end.date,
                     metrics = metrics,
                     dimensions = "ga:yearmonth",
                     table.id = table.id
                     )

  ga.query <- QueryBuilder(query.list)
  past.data <- GetReportData(ga.query, token)

  #-----------------------------------------------------------------------------
  # Clean past.data
  #-----------------------------------------------------------------------------

  past.data$yearmonth <- as.Date(as.yearmon(past.data$yearmonth, "%Y%m"))

  #-----------------------------------------------------------------------------
  # Turn past.data into an exploitable time-serie
  #-----------------------------------------------------------------------------

  ts.past.data <- ts(past.data[, -1],
                     start = c(as.numeric(substring(start.date, 1, 4)),
                           as.numeric(substring(start.date, 6, 7))),
                     end = c(as.numeric(substring(end.date, 1, 4)),
                         as.numeric(substring(end.date, 6, 7))),
                     frequency = 12)

  #-----------------------------------------------------------------------------
  # Make predictions.data using the auto-ARIMA model
  #-----------------------------------------------------------------------------

  fit <- auto.arima(ts.past.data)
  predictions.data <- forecast(fit, 12)
  
  #-----------------------------------------------------------------------------
  # Create plot of predictions.data
  #-----------------------------------------------------------------------------
  
  plot(predictions.data)
  
  #-----------------------------------------------------------------------------
  # Export data
  #-----------------------------------------------------------------------------

  if (export == TRUE) {
    write.xlsx(past.data, "PerformanceForecast_past_data.xls")
    write.xlsx(predictions.data, "PerformanceForecast_predictions_data.xls")
    png("PerformanceForecast_plot.png")
    plot(predictions.data)
    dev.off()
    }

}
