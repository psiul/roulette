select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 447 and ss.ss_hash <= 847 and hd.hd_hash >= 76 and hd.hd_hash <= 826 and c.c_hash >= 187 and c.c_hash <= 520
;
