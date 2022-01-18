select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 450 and ss.ss_hash <= 850 and cd.cd_hash >= 212 and cd.cd_hash <= 962 and hd.hd_hash >= 50 and hd.hd_hash <= 383
;
