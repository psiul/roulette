select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,customer_address a,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 264 and d.d_hash <= 664 and c.c_hash >= 127 and c.c_hash <= 877 and a.ca_hash >= 505 and a.ca_hash <= 838
;
