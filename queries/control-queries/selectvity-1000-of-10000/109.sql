select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 173 and d.d_hash <= 923 and cd.cd_hash >= 223 and cd.cd_hash <= 623 and hd.hd_hash >= 357 and hd.hd_hash <= 690
;
