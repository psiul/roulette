select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 405 and i.i_hash <= 738 and c.c_hash >= 18 and c.c_hash <= 768 and hd.hd_hash >= 545 and hd.hd_hash <= 945
;
