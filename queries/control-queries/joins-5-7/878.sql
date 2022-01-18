select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 636 and ss.ss_hash <= 969 and hd.hd_hash >= 186 and hd.hd_hash <= 936 and c.c_hash >= 593 and c.c_hash <= 993
;
