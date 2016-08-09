---
title       : US Baby Names
subtitle    : Popular names between 1880-2014
author      : Chad Banicki
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, quiz, bootstrap, interactive] # {mathjax, quiz, bootstrap}
ext_widgets : {rCharts: [libraries/nvd3, libraries/leaflet, libraries/dygraphs]}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
assets      : {assets: ../../assets}
---
<style type="text/css">
  body {background:grey transparent;
  }
</style>




## US Baby Names

If you've ever had a child, or just wondered how common your name was, this [product](https://platothewise.shinyapps.io/shinyapp/) may be of interest to you.  You can view the most popular names for a selected period in US history.  You can even search for a specific name, and see how common it is over time.

<img class=center
  src=http://frogonablog.com/BabyNames.PNG width=600px>

---

## Selection Filters

Select a range of dates and pick the number of popular names to display.  The names are ordered from most to least popular during that time-period.  Male names are colored <font color ='blue'>blue</font> and female names are <font color ='pink'>pink</font> .

<img class=center
  src=http://frogonablog.com/main_page.PNG width=600px>

---

## Most Popular Names and a Timeline
Select `Popular Names` and see a word cloud (by gender) of the most popular names for that time-period.  You can also select `Timeline`, enter a name, and see the popularity of that name over time.

<img src=http://frogonablog.com/word_cloud.PNG style="float: left; width: 45%; margin-right: 1%; margin-bottom: 0.5em;">
 
<img src=http://frogonablog.com/timelineFiltered.PNG style="float: right; width: 45%; margin-right: 1%; margin-bottom: 0.5em;">
 

---

### More to Explore

There is a lot more to [discover] (https://www.kaggle.com/kaggle/us-baby-names).  For example, some R code run during this `Slidify` presentation suggest there has been a shift away from traditional names since the 1950's.

<img src="assets/fig/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" angle=90 style="display: block; margin: auto;" />
---



*** =image

<img src=http://frogonablog.com/Timeline.PNG>

---

*** =image

<img src=http://frogonablog.com/word_cloud.PNG>

---

*** =image

<img src=http://frogonablog.com/timelineFiltered.PNG>

---  &checkbox

## Multi Text

*** =image

<img src=http://frogonablog.com/timelineFiltered.PNG>


--- .segue bg:grey


