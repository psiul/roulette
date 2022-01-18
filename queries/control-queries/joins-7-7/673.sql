select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,customer c,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 223 and i.i_hash <= 973 and c.c_hash >= 580 and c.c_hash <= 913 and a.ca_hash >= 11 and a.ca_hash <= 411
;
