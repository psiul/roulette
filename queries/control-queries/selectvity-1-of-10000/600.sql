select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 812 and ss.ss_hash <= 862 and hd.hd_hash >= 365 and hd.hd_hash <= 385 and c.c_hash >= 416 and c.c_hash <= 516
;
