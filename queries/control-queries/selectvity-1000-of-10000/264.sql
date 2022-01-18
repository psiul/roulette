select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 134 and ss.ss_hash <= 884 and hd.hd_hash >= 516 and hd.hd_hash <= 916 and d.d_hash >= 471 and d.d_hash <= 804
;
