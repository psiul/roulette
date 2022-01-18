select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 135 and ss.ss_hash <= 185 and cd.cd_hash >= 271 and cd.cd_hash <= 371 and c.c_hash >= 60 and c.c_hash <= 260
;
