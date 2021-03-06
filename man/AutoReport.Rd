% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/AutoReport.R
\name{AutoReport}
\alias{AutoReport}
\title{A detailed report of your website performance during a given month}
\usage{
AutoReport(start.date, end.date, table.id)
}
\arguments{
\item{start.date}{Start date for fetching Analytics data. Requests can
specify a start date formatted as YYYY-MM-DD, or as a relative date
(e.g., today, yesterday, or NdaysAgo where N is a positive integer).}

\item{end.date}{End date for fetching Analytics data. Request can specify
an end date formatted as YYYY-MM-DD, or as a relative date (e.g., today,
yesterday, or NdaysAgo where N is a positive integer).}

\item{table.id}{The unique table ID of the form ga:XXXX, where XXXX is the
Analytics view (profile) ID for which the query will retrieve the data.}
}
\description{
\code{Autoreport} is a quick way to check in details how your
  website performed during a given month.
}
\note{
The \code{AutoReport} function will generate a shareable HTML file
 in your working directory.
}
\examples{
\dontrun{
  AutoReport(start.date = "2015-01-01", end.date = "2015-07-30",
  table.id = "ga:XXXXXXX")}
}

