select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 30 and ss.ss_hash <= 780 and i.i_hash >= 171 and i.i_hash <= 504 and a.ca_hash >= 192 and a.ca_hash <= 592
;
