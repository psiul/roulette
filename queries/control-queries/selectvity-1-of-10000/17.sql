select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 149 and c.c_hash <= 169 and hd.hd_hash >= 710 and hd.hd_hash <= 810 and d.d_hash >= 367 and d.d_hash <= 417
;
