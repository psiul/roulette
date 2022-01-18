select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 216 and hd.hd_hash <= 966 and i.i_hash >= 126 and i.i_hash <= 526 and d.d_hash >= 391 and d.d_hash <= 724
;
