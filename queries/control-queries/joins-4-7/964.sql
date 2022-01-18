select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 103 and ss.ss_hash <= 853 and d.d_hash >= 661 and d.d_hash <= 994 and cd.cd_hash >= 360 and cd.cd_hash <= 760
;
