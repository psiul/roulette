select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 347 and ss.ss_hash <= 397 and d.d_hash >= 169 and d.d_hash <= 369 and hd.hd_hash >= 247 and hd.hd_hash <= 347
;
