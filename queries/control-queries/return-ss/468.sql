select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 185 and ss.ss_hash <= 935 and c.c_hash >= 22 and c.c_hash <= 422 and hd.hd_hash >= 562 and hd.hd_hash <= 895
;
