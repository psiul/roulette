select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 527 and d.d_hash <= 927 and i.i_hash >= 388 and i.i_hash <= 721 and a.ca_hash >= 205 and a.ca_hash <= 955
;
