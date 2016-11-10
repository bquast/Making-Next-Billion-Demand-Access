# Making the Next Billion Demand Access:<br/> `google.co.za` in Setswana
Bastiaan Quast  
10 November 2016  



## Introduction

* improved reach and affordability
* yet, stagnating growth


```r
ggplot(data=WB2016, aes(x=year, y=adoption, colour=region)) + geom_smooth(se=FALSE)
```

![](../misc/rmd-adoption_plot-1.png)<!-- -->


## Language Disparities

<img src='../misc/NativeSpeakersWebContent.png' width='800px' />

**QUESTION**: lowest bars, chicken vs. egg?


## Cross-Side Network Effects (2SM)

<img src='../misc/NetworkEffects-Telephones.png' width='600px' />

<img src='../misc/Cross-SideNetworkEffects-Websites.png' width='400px' />


## Stacked 2-Sided Markets

<img src='../misc/ProtocolStack.gif' width='800px' />


## Research Design

**Identification Strategy**: Setswana introduced on `google.co.za` at end the of 2010

  * Spillover of translation work for `google.co.bw`
  
**Data**: South Africa's National Income Dynamics Survey (2008, 2010, 2011, **2015**)

  * around 5,000 households; 15,000 adults; 1,500 Setswana speakers
  * cellphones, **computers**, and  **internet expenditure** (hh level)

![](../misc/rmd-data_plot-1.png)<!-- -->



## Internet Expenditure


                            Estimate   Std. Error       t value    Pr(>|t|)
-----------------------  -----------  -----------  ------------  ----------
(Intercept)               -0.0016483    0.0015285    -1.0783754   0.2808703
eventTRUE                 -0.0118218    0.0009715   -12.1690167   0.0000000
setswanaTRUE              -0.0134334    0.0023200    -5.7902814   0.0000000
a_womanTRUE               -0.0006753    0.0009301    -0.7259811   0.4678530
hhincome                   0.0000027    0.0000000    56.7219590   0.0000000
best_edu                   0.0012953    0.0000936    13.8375596   0.0000000
eventTRUE:setswanaTRUE     0.0120078    0.0030875     3.8892010   0.0001007


## Graphical Internet Expenditure

![](../misc/rmd-int_exp_basic-1.png)<!-- -->


## Computer Ownership

                            Estimate   Std. Error       t value    Pr(>|t|)
-----------------------  -----------  -----------  ------------  ----------
(Intercept)                0.0095949    0.0025592     3.7492016   0.0001775
eventTRUE                 -0.0061590    0.0016430    -3.7486711   0.0001779
setswanaTRUE              -0.0155134    0.0043191    -3.5918390   0.0003285
a_womanTRUE               -0.0269718    0.0014992   -17.9909045   0.0000000
hhincome                   0.0000054    0.0000001    71.7878843   0.0000000
best_edu                   0.0061744    0.0001527    40.4384106   0.0000000
eventTRUE:setswanaTRUE     0.0235410    0.0052777     4.4604463   0.0000082

* Covariates: linguistic skills
* Alt. formulation, Interact `event` with `language`: similar results


## Graphical Computer Ownership

![](../misc/rmd-own_comp_graphic_basic-1.png)<!-- -->


## Internet Expenditure interact w. Gender

                                        Estimate   Std. Error      t value    Pr(>|t|)
-----------------------------------  -----------  -----------  -----------  ----------
a_womanTRUE                           -0.0029251    0.0014732   -1.9855642   0.0470860
eventTRUE                             -0.0140322    0.0015184   -9.2412246   0.0000000
setswanaTRUE                          -0.0132704    0.0035118   -3.7787895   0.0001577
hhincome                               0.0000027    0.0000000   56.7250641   0.0000000
a_womanTRUE:eventTRUE                  0.0037265    0.0019673    1.8941725   0.0582066
a_womanTRUE:setswanaTRUE              -0.0004090    0.0046762   -0.0874677   0.9303000
eventTRUE:setswanaTRUE                 0.0099690    0.0047195    2.1123032   0.0346643
a_womanTRUE:eventTRUE:setswanaTRUE     0.0036802    0.0062400    0.5897653   0.5553501


## Graphical Internet Expenditure by Gender

![](../misc/rmd-int_exp_graphic_gender-1.png)<!-- -->


## Computer Ownership interact w. Gender

                                        Estimate   Std. Error      t value    Pr(>|t|)
-----------------------------------  -----------  -----------  -----------  ----------
a_womanTRUE                           -0.0214381    0.0027073   -7.9187425   0.0000000
eventTRUE                             -0.0019071    0.0025595   -0.7451353   0.4561919
setswanaTRUE                          -0.0205849    0.0065387   -3.1481517   0.0016436
hhincome                               0.0000054    0.0000001   71.7707269   0.0000000
a_womanTRUE:eventTRUE                 -0.0071995    0.0033242   -2.1657678   0.0303316
a_womanTRUE:setswanaTRUE               0.0093212    0.0087063    1.0706178   0.2843443
eventTRUE:setswanaTRUE                 0.0380603    0.0080460    4.7303343   0.0000022
a_womanTRUE:eventTRUE:setswanaTRUE    -0.0256385    0.0106599   -2.4051410   0.0161683


## Graphicak Computer Ownership by Gender

![](../misc/rmd-own_comp_gender-1.png)<!-- -->










## Usage of Setswana online

<img src='../misc/thuso.png' width='800px' />



* thuso = help (common term on Google Trends)


## Internet Expenditure -> Employment


```r
pids <- adulthh[which(adulthh$wave==3 & adulthh$h_nfnet==TRUE),]$pid
NIDS %>%
  filter(pid %in% pids) %>%
  group_by(setswana, wave) %>%
  summarise(employed = mean(employed, na.rm=TRUE)) %>%
  ggplot(aes(x=wave, y=employed, colour=setswana)) %+%
    geom_line() %+%
    scale_colour_brewer(palette='Set1')
```

![](../misc/rmd-nf_net_empl-1.png)<!-- -->


## Computer Ownership -> Employment

![](../misc/rmd-own_comp_empl-1.png)<!-- -->


## Closing Remarks

* accessibility improves adoption
* observed long term commitment: computer ownership
* mobile needs directly visible link?
* available online: http://qua.st/internet-access
    * data
    * code
    * paper
    * presentation
    
    
# Thank you

# Appendix

## A) Full breakdown internet expenditure

![](../misc/rmd-int_exp_full-1.png)<!-- -->

## B) Full breakdown computer ownership

![](../misc/rmd-own_comp_full-1.png)<!-- -->


## C) Cellphone Ownership Basic

![](../misc/rmd-own_cel_basic-1.png)<!-- -->


## D) Cellphone Ownership Full

![](../misc/rmd-own_cel_full-1.png)<!-- -->
