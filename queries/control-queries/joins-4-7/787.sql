select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 2 and c.c_hash <= 402 and d.d_hash >= 185 and d.d_hash <= 518 and cd.cd_hash >= 196 and cd.cd_hash <= 946
;
