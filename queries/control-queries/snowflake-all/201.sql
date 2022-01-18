select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 190 and ss.ss_hash <= 523 and hd.hd_hash >= 31 and hd.hd_hash <= 781 and d.d_hash >= 133 and d.d_hash <= 533
;
