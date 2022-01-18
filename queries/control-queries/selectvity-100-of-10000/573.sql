select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 744 and c.c_hash <= 944 and hd.hd_hash >= 459 and hd.hd_hash <= 959 and d.d_hash >= 401 and d.d_hash <= 501
;
