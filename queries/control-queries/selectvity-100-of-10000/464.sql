select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 165 and ss.ss_hash <= 665 and hd.hd_hash >= 339 and hd.hd_hash <= 539 and d.d_hash >= 376 and d.d_hash <= 476
;
