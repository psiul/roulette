select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 47 and c.c_hash <= 797 and hd.hd_hash >= 277 and hd.hd_hash <= 610 and d.d_hash >= 96 and d.d_hash <= 496
;
