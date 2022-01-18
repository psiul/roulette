select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 301 and d.d_hash <= 701 and cd.cd_hash >= 497 and cd.cd_hash <= 830 and c.c_hash >= 46 and c.c_hash <= 796
;
