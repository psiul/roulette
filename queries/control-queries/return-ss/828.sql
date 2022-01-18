select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 249 and ss.ss_hash <= 649 and cd.cd_hash >= 117 and cd.cd_hash <= 450 and d.d_hash >= 98 and d.d_hash <= 848
;
