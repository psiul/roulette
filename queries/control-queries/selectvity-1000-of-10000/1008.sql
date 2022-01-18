select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 152 and i.i_hash <= 902 and d.d_hash >= 272 and d.d_hash <= 672 and hd.hd_hash >= 552 and hd.hd_hash <= 885
;
