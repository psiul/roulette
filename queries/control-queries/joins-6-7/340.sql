select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 240 and d.d_hash <= 990 and i.i_hash >= 88 and i.i_hash <= 488 and hd.hd_hash >= 85 and hd.hd_hash <= 418
;
