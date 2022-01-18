select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 1 and ss.ss_hash <= 751 and d.d_hash >= 198 and d.d_hash <= 598 and hd.hd_hash >= 632 and hd.hd_hash <= 965
;
