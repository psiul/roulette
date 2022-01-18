select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 611 and ss.ss_hash <= 944 and c.c_hash >= 511 and c.c_hash <= 911 and i.i_hash >= 19 and i.i_hash <= 769
;
