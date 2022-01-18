select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 166 and ss.ss_hash <= 916 and c.c_hash >= 180 and c.c_hash <= 580 and cd.cd_hash >= 566 and cd.cd_hash <= 899
;
