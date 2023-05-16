/*
Find all wineries which produce wines by possessing aromas of plum,
cherry, rose, or hazelnut.

To make it more simply, look only for singular form of the mentioned 
aromas.Hint if one of the specified words is just a substring of another
word, this should not be a hit, but a miss.

example, 
description: hot, tannic and simple, with cherry jam and and currant 
flavours accompanied by high, tart acidity and chile-pepper alcohol heat.

Therefore the winery Bella Piazza is expected in the results.

table:
wineramg_p1
id int 
country varchar
description varchar
designation varchar
points int 
price float
province varchar
region_1 varchar
region_2 varchar
variety varchar
winery varchar

select winery
from winemag_p1
where desciption like '% cherry %' or % rose %' or % hazelnut %'
