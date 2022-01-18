select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 39 and cd.cd_hash <= 439 and i.i_hash >= 106 and i.i_hash <= 439 and d.d_hash >= 39 and d.d_hash <= 789
;
