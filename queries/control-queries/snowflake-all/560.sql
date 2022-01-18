select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 68 and ss.ss_hash <= 818 and c.c_hash >= 568 and c.c_hash <= 901 and hd.hd_hash >= 239 and hd.hd_hash <= 639
;
