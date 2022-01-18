select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 118 and ss.ss_hash <= 451 and d.d_hash >= 89 and d.d_hash <= 839 and a.ca_hash >= 300 and a.ca_hash <= 700
;
