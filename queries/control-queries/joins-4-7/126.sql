select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 232 and ss.ss_hash <= 982 and d.d_hash >= 347 and d.d_hash <= 680 and c.c_hash >= 496 and c.c_hash <= 896
;
