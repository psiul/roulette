select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 279 and ss.ss_hash <= 612 and hd.hd_hash >= 161 and hd.hd_hash <= 911 and c.c_hash >= 228 and c.c_hash <= 628
;
