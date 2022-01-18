select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 101 and c.c_hash <= 851 and a.ca_hash >= 489 and a.ca_hash <= 822 and hd.hd_hash >= 515 and hd.hd_hash <= 915
;
