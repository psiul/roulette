select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,date_dim d,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 228 and c.c_hash <= 628 and a.ca_hash >= 239 and a.ca_hash <= 989 and i.i_hash >= 633 and i.i_hash <= 966
;
