select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,item i,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 388 and c.c_hash <= 788 and i.i_hash >= 196 and i.i_hash <= 946 and d.d_hash >= 437 and d.d_hash <= 770
;
