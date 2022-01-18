select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 514 and hd.hd_hash <= 914 and c.c_hash >= 157 and c.c_hash <= 907 and d.d_hash >= 619 and d.d_hash <= 952
;
