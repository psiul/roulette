select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 30 and hd.hd_hash <= 780 and c.c_hash >= 594 and c.c_hash <= 927 and d.d_hash >= 394 and d.d_hash <= 794
;
