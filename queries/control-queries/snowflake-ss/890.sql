select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 218 and d.d_hash <= 968 and cd.cd_hash >= 119 and cd.cd_hash <= 519 and c.c_hash >= 621 and c.c_hash <= 954
;
