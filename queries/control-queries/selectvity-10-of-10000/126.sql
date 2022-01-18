select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 649 and hd.hd_hash <= 699 and a.ca_hash >= 446 and a.ca_hash <= 646 and d.d_hash >= 594 and d.d_hash <= 694
;
