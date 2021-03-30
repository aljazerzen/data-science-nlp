    25 - super, dve razlicni anotaciji
    26 - ima samo tweet id in label
    35 - super, ima veliko razlicnih annotacij
    32 - za kontaktrat avtorje, ni objavljen https://github.com/Mrezvan94/Harassment-Corpus
    13 - dva dataseta, oba imata samo tweet id

dataset 25
---------------

```
levels(task_1): c("HOF" "NOT")
levels(task_2): c("HATE" "NONE" "OFFN" "PRFN")
levels(task_3): c("NONE" "TIN"  "UNT" )
```

```
target: 'targeted', 'untargeted'
```

dataset 35
------------

```
       id           text                             sentiment   
 Min.   :   0   Length:5647        offensive              :2954  
 1st Qu.:1412   Class :character   normal                 : 661  
 Median :2823   Mode  :character   hateful                : 315  
 Mean   :2823                      offensive_hateful      : 252  
 3rd Qu.:4234                      offensive_disrespectful: 145  
 Max.   :5646                      abusive_offensive      : 115  
                                   (Other)                :1205  
    directness         annotator_sentiment                      target    
 direct  : 569   anger_disgust       : 557     disability        :1089  
 indirect:5078   sadness_disgust     : 373     gender            : 638  
                 indifference_disgust: 365     origin            :2448  
                 anger_sadness       : 334     other             : 890  
                 sadness_indifference: 311     religion          :  68  
                 anger_indifference  : 265     sexual_orientation: 514  
                 (Other)             :3442                              
              group     
 other           :1590  
 special_needs   :1571  
 women           : 878  
 individual      : 497  
 left_wing_people: 177  
 refugees        : 171  
 (Other)         : 763  
```

```
target: 
 [1] "african_descent"  "arabs"            "asians"           "christian"       
 [5] "gay"              "hispanics"        "immigrants"       "indian/hindu"    
 [9] "individual"       "jews"             "left_wing_people" "muslims"         
[13] "other"            "refugees"         "special_needs"    "women" 
```