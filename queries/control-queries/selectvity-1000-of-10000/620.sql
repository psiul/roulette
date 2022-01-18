select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 222 and ss.ss_hash <= 972 and d.d_hash >= 371 and d.d_hash <= 771 and cd.cd_hash >= 105 and cd.cd_hash <= 438
;
