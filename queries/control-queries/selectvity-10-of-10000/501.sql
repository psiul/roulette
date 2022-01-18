select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 328 and ss.ss_hash <= 528 and d.d_hash >= 465 and d.d_hash <= 515 and cd.cd_hash >= 456 and cd.cd_hash <= 556
;
