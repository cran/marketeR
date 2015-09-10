#-------------------------------------------------------------------------------
# Settings.R (marketeR) - made with <3 by fmikaelian
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
#' @import RGoogleAnalytics Rfacebook forecast zoo dplyr ggplot2 xlsx grid
#'   scales shiny rmarkdown knitr ggthemes
#' @importFrom plyr ddply
#' @importFrom grDevices dev.off png
#' @importFrom graphics plot
#' @importFrom stats setNames ts
#-------------------------------------------------------------------------------

globalVariables(c("token",
                  "as.yearmon",
                  "sessions",
                  "socialNetwork",
                  "yearMonth",
                  "deviceCategory",
                  "percentages",
                  "percentNewsessions",
                  "avgSessionDuration",
                  "bounceRate",
                  "channelGrouping",
                  "userGender",
                  "userAgeBracket",
                  "dayOfWeek",
                  "V2",
                  "dates",
                  "new_dates"
                  )
                )