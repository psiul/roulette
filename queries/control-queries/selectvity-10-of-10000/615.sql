select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 76 and c.c_hash <= 276 and i.i_hash >= 501 and i.i_hash <= 601 and d.d_hash >= 189 and d.d_hash <= 239
;
