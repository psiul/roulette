select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 417 and ss.ss_hash <= 467 and c.c_hash >= 869 and c.c_hash <= 889 and hd.hd_hash >= 522 and hd.hd_hash <= 622
;
