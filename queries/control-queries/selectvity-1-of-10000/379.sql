select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 795 and ss.ss_hash <= 895 and c.c_hash >= 889 and c.c_hash <= 909 and i.i_hash >= 759 and i.i_hash <= 809
;
