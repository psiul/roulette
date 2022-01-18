select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,item i,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 63 and d.d_hash <= 396 and i.i_hash >= 112 and i.i_hash <= 862 and a.ca_hash >= 14 and a.ca_hash <= 414
;
