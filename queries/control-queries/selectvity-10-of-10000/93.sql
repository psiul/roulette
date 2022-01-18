select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 2 and d.d_hash <= 202 and c.c_hash >= 680 and c.c_hash <= 780 and hd.hd_hash >= 725 and hd.hd_hash <= 775
;
