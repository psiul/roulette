select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 119 and d.d_hash <= 519 and c.c_hash >= 184 and c.c_hash <= 934 and cd.cd_hash >= 168 and cd.cd_hash <= 501
;
