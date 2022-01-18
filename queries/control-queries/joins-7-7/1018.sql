select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,item i,customer_address a,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 535 and ss.ss_hash <= 935 and d.d_hash >= 12 and d.d_hash <= 762 and a.ca_hash >= 42 and a.ca_hash <= 375
;
