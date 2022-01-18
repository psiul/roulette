select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 811 and ss.ss_hash <= 861 and hd.hd_hash >= 659 and hd.hd_hash <= 679 and d.d_hash >= 794 and d.d_hash <= 894
;
