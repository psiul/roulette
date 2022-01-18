select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 970 and ss.ss_hash <= 990 and hd.hd_hash >= 582 and hd.hd_hash <= 682 and c.c_hash >= 335 and c.c_hash <= 385
;
