select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 292 and ss.ss_hash <= 625 and i.i_hash >= 222 and i.i_hash <= 622 and c.c_hash >= 178 and c.c_hash <= 928
;
