select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 531 and ss.ss_hash <= 864 and c.c_hash >= 175 and c.c_hash <= 925 and i.i_hash >= 195 and i.i_hash <= 595
;
