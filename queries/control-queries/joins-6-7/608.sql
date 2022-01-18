select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 169 and ss.ss_hash <= 569 and hd.hd_hash >= 218 and hd.hd_hash <= 968 and a.ca_hash >= 15 and a.ca_hash <= 348
;
