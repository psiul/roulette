select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 75 and ss.ss_hash <= 825 and d.d_hash >= 546 and d.d_hash <= 879 and a.ca_hash >= 414 and a.ca_hash <= 814
;
