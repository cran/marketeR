#-------------------------------------------------------------------------------
# ui.R file (marketeR) - made with <3 by fmikaelian
#-------------------------------------------------------------------------------

shinyUI(fluidPage(

  #-----------------------------------------------------------------------------
  # Define the sidebarPanel elements
  #-----------------------------------------------------------------------------

  titlePanel("facebook_insights_dashboard"),
  sidebarLayout(
    sidebarPanel(

      # Create the start date selector -----------------------------------------

      dateInput("startdate",
                label = "start date",
                value = Sys.Date() - 30),

      # Create the end date selector -------------------------------------------

      dateInput("enddate",
                label = "end date",
                value = Sys.Date()),

      # Create the metric selector ---------------------------------------------

      selectInput("metric",
                  label = "metric",
                  c(Choose = "",
                    page_stories = 'page_stories',
                    page_storytellers = 'page_storytellers',
                    page_stories_by_story_type = 'page_stories_by_story_type',
                    page_storytellers_by_story_type = 'page_storytellers_by_story_type',
                    page_storytellers_by_age_gender = 'page_storytellers_by_age_gender',
                    page_storytellers_by_city = 'page_storytellers_by_city',
                    page_storytellers_by_country = 'page_storytellers_by_country',
                    page_storytellers_by_locale = 'page_storytellers_by_locale',
                    post_stories = 'post_stories',
                    post_storytellers = 'post_storytellers',
                    post_stories_by_action_type = 'post_stories_by_action_type',
                    post_storytellers_by_action_type = 'post_storytellers_by_action_type',
                    page_impressions = 'page_impressions',
                    page_impressions_unique = 'page_impressions_unique',
                    page_impressions_paid = 'page_impressions_paid',
                    page_impressions_paid_unique = 'page_impressions_paid_unique',
                    page_impressions_organic = 'page_impressions_organic',
                    page_impressions_organic_unique = 'page_impressions_organic_unique',
                    page_impressions_viral = 'page_impressions_viral',
                    page_impressions_viral_unique = 'page_impressions_viral_unique',
                    page_impressions_by_story_type = 'page_impressions_by_story_type',
                    page_impressions_by_story_type_unique = 'page_impressions_by_story_type_unique',
                    page_impressions_by_city_unique = 'page_impressions_by_city_unique',
                    page_impressions_by_country_unique = 'page_impressions_by_country_unique',
                    page_impressions_by_locale_unique = 'page_impressions_by_locale_unique',
                    page_impressions_by_age_gender_unique = 'page_impressions_by_age_gender_unique',
                    page_impressions_frequency_distribution = 'page_impressions_frequency_distribution',
                    page_impressions_viral_frequency_distribution = 'page_impressions_viral_frequency_distribution',
                    page_impressions_by_paid_non_paid = 'page_impressions_by_paid_non_paid',
                    page_impressions_by_paid_non_paid_unique = 'page_impressions_by_paid_non_paid_unique',
                    page_engaged_users = 'page_engaged_users',
                    page_consumptions = 'page_consumptions',
                    page_consumptions_unique = 'page_consumptions_unique',
                    page_consumptions_by_consumption_type = 'page_consumptions_by_consumption_type',
                    page_consumptions_by_consumption_type_unique = 'page_consumptions_by_consumption_type_unique',
                    page_places_checkin_total = 'page_places_checkin_total',
                    page_places_checkin_total_unique = 'page_places_checkin_total_unique',
                    page_places_checkin_mobile = 'page_places_checkin_mobile',
                    page_places_checkin_mobile_unique = 'page_places_checkin_mobile_unique',
                    page_places_checkins_by_age_gender = 'page_places_checkins_by_age_gender',
                    page_places_checkins_by_locale = 'page_places_checkins_by_locale',
                    page_places_checkins_by_country = 'page_places_checkins_by_country',
                    page_negative_feedback = 'page_negative_feedback',
                    page_negative_feedback_unique = 'page_negative_feedback_unique',
                    page_negative_feedback_by_type = 'page_negative_feedback_by_type',
                    page_negative_feedback_by_type_unique = 'page_negative_feedback_by_type_unique',
                    page_positive_feedback_by_type = 'page_positive_feedback_by_type',
                    page_positive_feedback_by_type_unique = 'page_positive_feedback_by_type_unique',
                    page_fans_online = 'page_fans_online',
                    page_fans_online_per_day = 'page_fans_online_per_day',
                    page_fans = 'page_fans',
                    page_fans_locale = 'page_fans_locale',
                    page_fans_city = 'page_fans_city',
                    page_fans_country = 'page_fans_country',
                    page_fans_gender_age = 'page_fans_gender_age',
                    page_fan_adds = 'page_fan_adds',
                    page_fan_adds_unique = 'page_fan_adds_unique',
                    page_fans_by_like_source = 'page_fans_by_like_source',
                    page_fans_by_like_source_unique = 'page_fans_by_like_source_unique',
                    page_fan_removes = 'page_fan_removes',
                    page_fan_removes_unique = 'page_fan_removes_unique',
                    page_fans_by_unlike_source_unique = 'page_fans_by_unlike_source_unique',
                    post_stories_by_action_type = 'post_stories_by_action_type',
                    post_consumptions_by_type = 'post_consumptions_by_type',
                    page_consumptions_by_consumption_type = 'page_consumptions_by_consumption_type',
                    page_tab_views_login_top_unique = 'page_tab_views_login_top_unique',
                    page_tab_views_login_top = 'page_tab_views_login_top',
                    page_tab_views_logout_top = 'page_tab_views_logout_top',
                    page_views = 'page_views',
                    page_views_unique = 'page_views_unique',
                    page_views_login = 'page_views_login',
                    page_views_login_unique = 'page_views_login_unique',
                    page_views_logout = 'page_views_logout',
                    page_views_external_referrals = 'page_views_external_referrals',
                    page_posts_impressions = 'page_posts_impressions',
                    page_posts_impressions_unique = 'page_posts_impressions_unique',
                    page_posts_impressions_paid = 'page_posts_impressions_paid',
                    page_posts_impressions_paid_unique = 'page_posts_impressions_paid_unique',
                    page_posts_impressions_organic = 'page_posts_impressions_organic',
                    page_posts_impressions_organic_unique = 'page_posts_impressions_organic_unique',
                    page_posts_impressions_viral = 'page_posts_impressions_viral',
                    page_posts_impressions_viral_unique = 'page_posts_impressions_viral_unique',
                    page_posts_impressions_frequency_distribution = 'page_posts_impressions_frequency_distribution',
                    page_posts_impressions_by_paid_non_paid = 'page_posts_impressions_by_paid_non_paid',
                    page_posts_impressions_by_paid_non_paid_unique = 'page_posts_impressions_by_paid_non_paid_unique',
                    post_impressions = 'post_impressions',
                    post_impressions_unique = 'post_impressions_unique',
                    post_impressions_paid = 'post_impressions_paid',
                    post_impressions_paid_unique = 'post_impressions_paid_unique',
                    post_impressions_fan = 'post_impressions_fan',
                    post_impressions_fan_unique = 'post_impressions_fan_unique',
                    post_impressions_fan_paid = 'post_impressions_fan_paid',
                    post_impressions_fan_paid_unique = 'post_impressions_fan_paid_unique',
                    post_impressions_organic = 'post_impressions_organic',
                    post_impressions_organic_unique = 'post_impressions_organic_unique',
                    post_impressions_viral = 'post_impressions_viral',
                    post_impressions_viral_unique = 'post_impressions_viral_unique',
                    post_impressions_by_story_type = 'post_impressions_by_story_type',
                    post_impressions_by_story_type_unique = 'post_impressions_by_story_type_unique',
                    post_impressions_by_paid_non_paid = 'post_impressions_by_paid_non_paid',
                    post_impressions_by_paid_non_paid_unique = 'post_impressions_by_paid_non_paid_unique',
                    post_consumptions = 'post_consumptions',
                    post_consumptions_unique = 'post_consumptions_unique',
                    post_consumptions_by_type = 'post_consumptions_by_type',
                    post_consumptions_by_type_unique = 'post_consumptions_by_type_unique',
                    post_engaged_users = 'post_engaged_users',
                    post_negative_feedback = 'post_negative_feedback',
                    post_negative_feedback_unique = 'post_negative_feedback_unique',
                    post_negative_feedback_by_type = 'post_negative_feedback_by_type',
                    post_negative_feedback_by_type_unique = 'post_negative_feedback_by_type_unique',
                    post_video_avg_time_watched = 'post_video_avg_time_watched',
                    post_video_complete_views_organic = 'post_video_complete_views_organic',
                    post_video_complete_views_organic_unique = 'post_video_complete_views_organic_unique',
                    post_video_complete_views_paid = 'post_video_complete_views_paid',
                    post_video_complete_views_paid_unique = 'post_video_complete_views_paid_unique',
                    post_video_retention_graph = 'post_video_retention_graph',
                    post_video_views_organic = 'post_video_views_organic',
                    post_video_views_organic_unique = 'post_video_views_organic_unique',
                    post_video_views_paid = 'post_video_views_paid',
                    post_video_views_paid_unique = 'post_video_views_paid_unique',
                    domain_feed_clicks = 'domain_feed_clicks',
                    domain_feed_views = 'domain_feed_views',
                    domain_stories = 'domain_stories',
                    domain_widget_comments_adds = 'domain_widget_comments_adds',
                    domain_widget_comments_views = 'domain_widget_comments_views',
                    domain_widget_comments_feed_views = 'domain_widget_comments_feed_views',
                    domain_widget_comments_feed_clicks = 'domain_widget_comments_feed_clicks',
                    domain_widget_like_views = 'domain_widget_like_views',
                    domain_widget_likes = 'domain_widget_likes',
                    domain_widget_like_feed_views = 'domain_widget_like_feed_views',
                    domain_widget_like_feed_clicks = 'domain_widget_like_feed_clicks',
                    domain_widget_send_views = 'domain_widget_send_views',
                    domain_widget_send_clicks = 'domain_widget_send_clicks',
                    domain_widget_send_inbox_views = 'domain_widget_send_inbox_views',
                    domain_widget_send_inbox_clicks = 'domain_widget_send_inbox_clicks'
                    )
                  ),

      # Create the period selector ---------------------------

      selectInput("period",
                  label = "period",
                  c(Choose = "",
                    day = 'day',
                    week = 'week',
                    month = 'month',
                    day_28 = 'day_28',
                    lifetime = 'lifetime')
                  ),

      # Create the input Object_ID  ---------------------------

      textInput("object_ID",
                label = "object_ID",
                value = ""),

      # Create the token input field ---------------------------

      textInput("token",
                label = "token",
                value = "")
    ),

    #---------------------------------------------------------------------------
    # Define the output
    #---------------------------------------------------------------------------

    mainPanel(

      # Show the plot ----------------------------------------------------------
      plotOutput("plot"),

      # Show the download data button ------------------------------------------

      downloadButton("downloadData", "Download Data"),

      # Show the download Plot button ------------------------------------------

      downloadButton("downloadPlot", "Download Plot")

    )
  )
 )
 )
