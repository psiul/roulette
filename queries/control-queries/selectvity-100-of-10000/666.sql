select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 143 and ss.ss_hash <= 643 and cd.cd_hash >= 157 and cd.cd_hash <= 357 and hd.hd_hash >= 400 and hd.hd_hash <= 500
;
