select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 497 and ss.ss_hash <= 897 and c.c_hash >= 156 and c.c_hash <= 906 and d.d_hash >= 410 and d.d_hash <= 743
;
