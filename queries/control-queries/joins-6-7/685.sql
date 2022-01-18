select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 282 and ss.ss_hash <= 615 and i.i_hash >= 508 and i.i_hash <= 908 and c.c_hash >= 101 and c.c_hash <= 851
;