select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 735 and ss.ss_hash <= 835 and c.c_hash >= 503 and c.c_hash <= 703 and i.i_hash >= 410 and i.i_hash <= 910
;
