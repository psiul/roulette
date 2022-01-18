select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 791 and d.d_hash <= 891 and c.c_hash >= 396 and c.c_hash <= 896 and hd.hd_hash >= 247 and hd.hd_hash <= 447
;
