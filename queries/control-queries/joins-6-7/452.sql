select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 570 and d.d_hash <= 903 and hd.hd_hash >= 65 and hd.hd_hash <= 815 and a.ca_hash >= 445 and a.ca_hash <= 845
;
