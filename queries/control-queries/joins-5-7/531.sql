select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 573 and ss.ss_hash <= 906 and i.i_hash >= 5 and i.i_hash <= 755 and c.c_hash >= 25 and c.c_hash <= 425
;
