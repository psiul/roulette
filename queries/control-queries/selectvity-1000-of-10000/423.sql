select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 54 and cd.cd_hash <= 454 and hd.hd_hash >= 153 and hd.hd_hash <= 486 and d.d_hash >= 64 and d.d_hash <= 814
;
