select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 72 and c.c_hash <= 822 and cd.cd_hash >= 379 and cd.cd_hash <= 779 and hd.hd_hash >= 357 and hd.hd_hash <= 690
;
