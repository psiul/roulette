select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 534 and ss.ss_hash <= 867 and hd.hd_hash >= 150 and hd.hd_hash <= 900 and d.d_hash >= 145 and d.d_hash <= 545
;
