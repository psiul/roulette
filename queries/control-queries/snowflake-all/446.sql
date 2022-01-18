select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 95 and c.c_hash <= 845 and d.d_hash >= 467 and d.d_hash <= 867 and hd.hd_hash >= 571 and hd.hd_hash <= 904
;
