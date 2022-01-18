select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 86 and ss.ss_hash <= 419 and c.c_hash >= 154 and c.c_hash <= 904 and hd.hd_hash >= 296 and hd.hd_hash <= 696
;
