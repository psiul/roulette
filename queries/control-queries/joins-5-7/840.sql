select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 425 and hd.hd_hash <= 758 and c.c_hash >= 1 and c.c_hash <= 751 and d.d_hash >= 189 and d.d_hash <= 589
;
