select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 391 and hd.hd_hash <= 791 and i.i_hash >= 173 and i.i_hash <= 923 and a.ca_hash >= 207 and a.ca_hash <= 540
;
