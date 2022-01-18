select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 508 and ss.ss_hash <= 841 and d.d_hash >= 61 and d.d_hash <= 811 and i.i_hash >= 406 and i.i_hash <= 806
;
