select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 87 and i.i_hash <= 420 and c.c_hash >= 491 and c.c_hash <= 891 and hd.hd_hash >= 210 and hd.hd_hash <= 960
;
