select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 370 and hd.hd_hash <= 870 and cd.cd_hash >= 48 and cd.cd_hash <= 248 and c.c_hash >= 275 and c.c_hash <= 375
;
