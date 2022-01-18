select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 588 and c.c_hash <= 988 and hd.hd_hash >= 125 and hd.hd_hash <= 875 and a.ca_hash >= 200 and a.ca_hash <= 533
;
