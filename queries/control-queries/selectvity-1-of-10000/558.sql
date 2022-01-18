select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 777 and d.d_hash <= 827 and hd.hd_hash >= 792 and hd.hd_hash <= 892 and c.c_hash >= 694 and c.c_hash <= 714
;
