-- 3
create database ecommerce;
show tables;
use ecommerce;
desc users_data;
-- 4
select * from users_data limit 100;
-- 5 
select count(distinct(country)) country,count(distinct(language)) language from users_data;
-- 6
select max(socialNbFollowers) followers,gender from users_data group by gender;
-- 7
select count(hasProfilePicture) profile_pic from users_data where hasProfilePicture like 'T%';
select count(hasAnyApp) ecommerce_platform from users_data where hasAnyApp like 'T%';
select count(hasAndroidApp) android_app from users_data where hasAndroidApp like 'T%';
select count(hasIosApp) ios_app from users_data where hasIosApp like 'T%';
-- 8
select * from users_data;
desc users_data;
select country, sum(productsBought) buyers from (select  * from users_data where productsBought = 1) b group by country order by buyers desc;
-- 9
select country, sum(productsSold) sellers from (select  * from users_data where productsSold = 1) b group by country order by sellers desc;
-- 10
select country,max(productsPassRate) product_rate from users_data group by country order by product_rate desc limit 10;
-- 11
select language, count(*) user_number from users_data where hasAnyApp = 'True' group by language ;
-- 12
select * from (select * from users_data where gender = 'F') a where socialProductsLiked > 0 union select * from (select * from users_data where gender = 'F') a where productsWished > 0 ;
-- 13
select * from (select * from users_data where gender = 'M') b where productsSold > 0 union select * from (select * from users_data where gender = 'M') a where productsBought > 0 ;
 -- 14
select country, max(productsSold) buyers from users_data group by country order by buyers desc;
-- 15
select country,productsSold sellers from users_data where productsSold < 1 group by country limit 10 ;
-- 16
select * from (select * from users_data where hasAnyApp = 'true') a order by daysSinceLastLogin asc limit 110 ;
-- 17
select  count(*) from (select * from users_data where gender ='F') a where daysSinceLastLogin >= 100 order by daysSinceLastLogin asc;
-- 18
select country, count(*) female_user from (select * from users_data where hasAnyApp = 'True') a where gender = 'F' group by country;
-- 19
select country, count(*) male_user from (select * from users_data where hasAnyApp = 'True') a where gender = 'M' group by country;
-- 20
select country, avg(productsBought) Bought,avg(productsSold) sold from (select * from users_data where hasAnyApp = 'True') a where gender = 'M' group by country order by country;