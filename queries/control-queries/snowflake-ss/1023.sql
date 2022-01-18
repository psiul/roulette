select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 268 and ss.ss_hash <= 668 and i.i_hash >= 628 and i.i_hash <= 961 and c.c_hash >= 226 and c.c_hash <= 976
;
