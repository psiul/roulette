select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 519 and ss.ss_hash <= 569 and d.d_hash >= 32 and d.d_hash <= 232 and hd.hd_hash >= 626 and hd.hd_hash <= 726
;
