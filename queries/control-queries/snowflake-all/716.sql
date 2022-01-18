select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 311 and ss.ss_hash <= 711 and i.i_hash >= 387 and i.i_hash <= 720 and d.d_hash >= 122 and d.d_hash <= 872
;
