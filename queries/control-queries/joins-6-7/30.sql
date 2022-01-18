select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 128 and d.d_hash <= 878 and i.i_hash >= 549 and i.i_hash <= 949 and hd.hd_hash >= 491 and hd.hd_hash <= 824
;
