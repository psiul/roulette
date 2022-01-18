select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 274 and ss.ss_hash <= 324 and cd.cd_hash >= 285 and cd.cd_hash <= 385 and c.c_hash >= 202 and c.c_hash <= 402
;
