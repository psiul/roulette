select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,customer_demographics cd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 13 and c.c_hash <= 413 and cd.cd_hash >= 381 and cd.cd_hash <= 714 and a.ca_hash >= 64 and a.ca_hash <= 814
;