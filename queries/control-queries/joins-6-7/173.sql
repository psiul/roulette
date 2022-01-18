select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,household_demographics hd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 336 and ss.ss_hash <= 669 and hd.hd_hash >= 44 and hd.hd_hash <= 794 and a.ca_hash >= 32 and a.ca_hash <= 432
;
