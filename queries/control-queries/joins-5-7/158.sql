select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 6 and ss.ss_hash <= 339 and hd.hd_hash >= 71 and hd.hd_hash <= 821 and c.c_hash >= 445 and c.c_hash <= 845
;
