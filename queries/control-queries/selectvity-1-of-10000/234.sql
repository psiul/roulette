select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 693 and hd.hd_hash <= 793 and d.d_hash >= 829 and d.d_hash <= 879 and a.ca_hash >= 848 and a.ca_hash <= 868
;
