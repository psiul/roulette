select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 28 and ss.ss_hash <= 428 and cd.cd_hash >= 109 and cd.cd_hash <= 859 and i.i_hash >= 497 and i.i_hash <= 830
;
