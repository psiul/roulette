select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 389 and c.c_hash <= 789 and d.d_hash >= 232 and d.d_hash <= 982 and hd.hd_hash >= 390 and hd.hd_hash <= 723
;
