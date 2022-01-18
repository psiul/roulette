select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 672 and cd.cd_hash <= 872 and i.i_hash >= 182 and i.i_hash <= 282 and c.c_hash >= 231 and c.c_hash <= 281
;
