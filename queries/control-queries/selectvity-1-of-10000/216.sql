select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 369 and ss.ss_hash <= 469 and c.c_hash >= 285 and c.c_hash <= 305 and hd.hd_hash >= 148 and hd.hd_hash <= 198
;
