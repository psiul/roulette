select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 27 and cd.cd_hash <= 360 and d.d_hash >= 303 and d.d_hash <= 703 and hd.hd_hash >= 52 and hd.hd_hash <= 802
;
