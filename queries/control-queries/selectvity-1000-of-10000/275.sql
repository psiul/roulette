select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 486 and ss.ss_hash <= 886 and hd.hd_hash >= 380 and hd.hd_hash <= 713 and c.c_hash >= 170 and c.c_hash <= 920
;
