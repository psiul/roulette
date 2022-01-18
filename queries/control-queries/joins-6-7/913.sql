select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 60 and ss.ss_hash <= 460 and d.d_hash >= 102 and d.d_hash <= 852 and hd.hd_hash >= 312 and hd.hd_hash <= 645
;
