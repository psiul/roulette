select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 501 and ss.ss_hash <= 901 and cd.cd_hash >= 216 and cd.cd_hash <= 966 and c.c_hash >= 38 and c.c_hash <= 371
;
