select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 161 and ss.ss_hash <= 561 and cd.cd_hash >= 588 and cd.cd_hash <= 921 and i.i_hash >= 196 and i.i_hash <= 946
;
