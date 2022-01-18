select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 462 and c.c_hash <= 795 and hd.hd_hash >= 476 and hd.hd_hash <= 876 and d.d_hash >= 167 and d.d_hash <= 917
;
