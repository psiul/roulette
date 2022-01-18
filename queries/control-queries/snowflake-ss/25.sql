select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 217 and c.c_hash <= 617 and hd.hd_hash >= 33 and hd.hd_hash <= 783 and a.ca_hash >= 507 and a.ca_hash <= 840
;
