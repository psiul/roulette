select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 587 and ss.ss_hash <= 920 and d.d_hash >= 457 and d.d_hash <= 857 and c.c_hash >= 220 and c.c_hash <= 970
;
