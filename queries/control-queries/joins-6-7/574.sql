select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 169 and ss.ss_hash <= 919 and i.i_hash >= 89 and i.i_hash <= 422 and hd.hd_hash >= 345 and hd.hd_hash <= 745
;
