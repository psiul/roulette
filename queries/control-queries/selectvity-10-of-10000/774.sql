select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 350 and ss.ss_hash <= 450 and i.i_hash >= 195 and i.i_hash <= 245 and c.c_hash >= 237 and c.c_hash <= 437
;
