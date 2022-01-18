select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 48 and ss.ss_hash <= 798 and cd.cd_hash >= 11 and cd.cd_hash <= 344 and hd.hd_hash >= 207 and hd.hd_hash <= 607
;
