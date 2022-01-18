select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 46 and c.c_hash <= 146 and cd.cd_hash >= 388 and cd.cd_hash <= 438 and d.d_hash >= 170 and d.d_hash <= 190
;
