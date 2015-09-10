## marketeR [![CRAN](http://www.r-pkg.org/badges/version/marketeR)](http://cran.rstudio.com/package=marketeR) [![Downloads](http://cranlogs.r-pkg.org/badges/marketeR?color=brightgreen)](http://www.r-pkg.org/pkg/marketeR)[![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html) 

![marketer_logo](https://github.com/fmikaelian/marketeR/blob/master/img/marketer_logo.png?raw=true)

### Enhanced analytics for marketers navigating the ocean of web data :ocean:

The [marketeR package](http://cran.r-project.org/package=marketeR) provides a web analytics toolbox for marketers using services such as Google Analytics, Facebook Insights, etc.

It gives access to essential tricks digital marketers need in their daily work : automatic reports, audience forecasts, performance evaluation, quick data exploration dashboards, and more.

As the swordfish, the marketeR package will provide you the great speed and agility to navigate the ocean of web data :fish: !

### Table of contents

* [Installation](#installation)
  * [From CRAN](#from-cran)
  * [From GitHub](#from-github)
* [Authentification](#authentification)
* [Examples](#examples)
  * [The AutoReport function](#the-autoreport-function)
  * [The PerformanceForecast function](#the-performanceforecast-function)
  * [The WeekSummary function](#the-weeksummary-function)
  * [The FacebookInsightsDashboard function](#the-facebookinsightsdashboard-function)
* [Terms & Conditions](#terms--conditions)
  * [Author](#author)
  * [Copyrights & licenses](#copyrights--licenses)
  * [Dependencies](#dependencies)
  * [Contributing](#contributing)

### Installation

##### From CRAN

Released and tested versions of the marketeR package are available directly via the
[CRAN](http://cran.r-project.org) network, and can be installed from within R via the following code :

```
install.packages("marketeR")
```

##### From GitHub

The last updates of the marketeR package are available via Github, and can be installed from within R via the following code :

```
# install.packages("devtools")
install_github("fmikaelian/marketeR")
```

### Authentification

The marketeR package is using the [Google Analytics Core Reporting API](https://developers.google.com/analytics/devguides/reporting/core/v3/) to get the data you need, and require you to be authentified with an access token. If you don't know what this is about, please follow the instructions below :

- Go to [Google Developers Console](https://console.developers.google.com/project).
- Click on the *Create Project* button to create a new project.
- Click on the *APIs* tab in the sidebar, search for *Analytics API*, and make sure it is correctly enabled.
- Click on the *Credentials* tab in the sidebar,  then on the *add credentials* button, then on the *Oauth 2.0 client ID* option, check the *Other* box, and finally click on the *Create* button.
- You should now be able to get your *Client ID* and *Client secret*.

Now, paste your credentials from within R as shown below :

```
client.id <- "PASTE HERE YOUR CLIENT ID"
client.secret <- "PASTE HERE YOUR CLIENT SECRET"
```

Create your token object, then validate it :

```
token <- Auth(client.id, client.secret)
ValidateToken(token)
```

You can also save your token for future sessions :

```
save(token, file="./token_file")
```

So that in future sessions, you can just load your token and validate it :

```
load("./token_file")
ValidateToken(token)
```

### Examples

Before starting to go deeper into marketeR tricks, remember to make sure that :

- You are authentified (see the **Authentification** section above). 
- You downloaded the complete documentation of the marketeR package, available via the [CRAN](http://cran.r-project.org/package=marketeR) network.

#### The AutoReport function

> **Problem :** You want to get the audience report of your website during the last month.

![PerformanceForecast](https://github.com/fmikaelian/marketeR/blob/master/img/AutoReport.png?raw=true)

The `AutoReport` function is a quick way to check in details how your website performed during the last month. 

The example below shows you how to get the report of your website (*table.id*), during the month of july 2015 (*end.date*). Note that the report will also display the audience evolution since the month of January 2015 (*start.date*).

```
AutoReport(start.date = "2015-01-01", end.date = "2015-07-30", table.id = "ga:XXXXXXX")
```

Once the process is ended, you will find the report as a shareable HTML file in your current working directory. If you are not sure about your current directory location, you can type from within R the following code to figure it out : 

```
getwd()
```

#### The PerformanceForecast function

> **Problem :** You want to know how your website audience will evolve in the next months.

![PerformanceForecast](https://github.com/fmikaelian/marketeR/blob/master/img/PerformanceForecast.png?raw=true)

The `PerformanceForecast` function is a quick way to predict how your website will perform in the next 12 months based on your past scores.

The example below shows you how to get the forecast of your website (*table.id*), in terms of sessions (*metrics*), based on a chosen period of historical data from February 2007 to July 2015 (*start.date/end.date*). Please note that the more historical data you have, the more accurate the forecast will be.

```
PerformanceForecast(start.date = "2007-02-01", end.date ="2015-06-30", metrics = "ga:sessions", table.id = "ga:XXXXXXX", export = TRUE)
```

Once the process is ended, as the *export* option is set as "TRUE", both raw data & graphics will be exported in the current working directory. If the *export* option is set as "FALSE", R will only print raw data and display a visualization of the forecast.

#### The WeekSummary function

> **Problem :** You want to know how your website audience performed during the last 7 days, compared to your usual audience scores.

![WeekSummary](https://github.com/fmikaelian/marketeR/blob/master/img/WeekSummary.png?raw=true)

The `WeekSummary` function is a quick way to check how your website performed during the past 7 days, compared to your past scores.

The example below shows you how to get the week summary of your website (*table.id*), in terms of sessions (*metrics*).

```
WeekSummary(metrics = "ga:sessions", table.id = "ga:XXXXXXX", export = TRUE)
```

Once the process is ended, as the *export* option is set as "TRUE", both raw data & graphics will be exported in the current working directory. If the *export* option is set as "FALSE", R will only print raw data and display a visualization of the week summary.

#### The FacebookInsightsDashboard function

> **Problem :** You are using Facebook insights in your daily work but you are not happy with its limited functions.

![FacebookInsightsDashboard](https://github.com/fmikaelian/marketeR/blob/master/img/FacebookInsightsDashboard.png?raw=true)

The `FacebookInsightsDashboard` function is a faster and easier way to explore your Facebook data without having to care about coding. 

##### Setting up the dashboard

The FacebookInsightsDashboard set up process is divided into the folowing 4 steps :

###### 1. Access the dashboard

The example below shows you how to acess the dashboard from within R.

```
FacebookInsightsDashboard()
```

###### 2. Get your token

You can get your token by launching the Graph API explorer from Facebook, available [here.](https://developers.facebook.com/tools/explorer/) You just have to copy/paste it from the box shown above to the dashboard.
For security reasons, your token will expire if you log-out your Facebook account or after 30 minutes of activity.

![Token](https://github.com/fmikaelian/marketeR/blob/master/img/Token.png?raw=true)

###### 3. Get your object_ID
Your object_ID could be a page_ID, a post_ID, or a domain_ID. Assuming you want to get insights for a page, you will find the page_ID within the Facebook URL of the page. The URL syntax should look like this : facebook.com/page_ID

###### 4. Select your query parameters
+ *Dates :*
Just select the date range for your insights query.

+ *Metric :*
The insights metric reference is available [here.](https://developers.facebook.com/docs/graph-api/reference/v2.4/insights) As you can see, some metrics are page-related, some others are post-related or even domain-related. So be sure you selected an object_ID type that matches the metric you chose.

+ *Period :*
The period parameter is different from the *start-date / end-date* parameter. For instance, if you chose a period=*week*, results will show daily values. For instance, if the *page_impressions* (period=*week*) for the date Friday May 8th is X, that means that from Friday May 1st to Friday May 8th, there was a total of X *page_impressions*. It is the same concept for other period parameters.

+ *Download buttons :*
If you need to export the graphics generated by the dashboard, or just want to store the raw data extracted from Facebook, you can use the download buttons.


### Terms & Conditions

##### Author

Félix MIKAELIAN <felix.mikaelian@essec.edu> :fr:

##### Copyrights & licenses

- The marketeR package is under license GPL (>= 2).
- The marketeR logo is using the *"Enriqueta"* font by [FontFuror](http://www.fontfuror.com/).
- The marketeR logo is using the icon *"Swordfish"* by [Catalina Montes](http://www.pezglobo.cl/).

##### Dependencies

The marketeR package use the following packages :

- RGoogleAnalytics
- Rfacebook
- forecast
- zoo
- plyr
- dplyr
- ggplot2
- xlsx
- grid
- scales
- shiny
- rmarkdown
- knitr
- ggthemes

##### Contributing

The marketeR package is the compilation of some work tools I've been creating for specific work purposes. I thought that other digital marketers would also find my tricks interesting for their daily work, so I decided to release it as an open-source project.

I would also love ideas to make marketeR better, so feel free to contribute to this exciting project :v: !
