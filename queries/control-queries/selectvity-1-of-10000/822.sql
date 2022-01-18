select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 855 and ss.ss_hash <= 955 and c.c_hash >= 115 and c.c_hash <= 135 and d.d_hash >= 911 and d.d_hash <= 961
;
