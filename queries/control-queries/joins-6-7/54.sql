select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 275 and c.c_hash <= 675 and hd.hd_hash >= 247 and hd.hd_hash <= 580 and a.ca_hash >= 14 and a.ca_hash <= 764
;
