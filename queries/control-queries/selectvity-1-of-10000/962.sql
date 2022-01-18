select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 94 and hd.hd_hash <= 144 and cd.cd_hash >= 516 and cd.cd_hash <= 616 and c.c_hash >= 362 and c.c_hash <= 382
;
