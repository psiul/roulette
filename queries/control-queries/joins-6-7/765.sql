select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 270 and hd.hd_hash <= 603 and i.i_hash >= 295 and i.i_hash <= 695 and d.d_hash >= 28 and d.d_hash <= 778
;
