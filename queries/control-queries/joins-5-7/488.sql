select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 350 and ss.ss_hash <= 750 and c.c_hash >= 180 and c.c_hash <= 513 and hd.hd_hash >= 116 and hd.hd_hash <= 866
;
