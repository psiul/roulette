select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 114 and ss.ss_hash <= 864 and d.d_hash >= 563 and d.d_hash <= 896 and hd.hd_hash >= 487 and hd.hd_hash <= 887
;
