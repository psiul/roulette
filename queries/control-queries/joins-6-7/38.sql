select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 449 and c.c_hash <= 849 and d.d_hash >= 103 and d.d_hash <= 436 and a.ca_hash >= 190 and a.ca_hash <= 940
;
