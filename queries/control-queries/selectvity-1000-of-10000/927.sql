select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 495 and hd.hd_hash <= 828 and i.i_hash >= 216 and i.i_hash <= 966 and d.d_hash >= 67 and d.d_hash <= 467
;
