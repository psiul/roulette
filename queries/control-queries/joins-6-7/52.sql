select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,date_dim d,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 527 and i.i_hash <= 927 and c.c_hash >= 312 and c.c_hash <= 645 and a.ca_hash >= 204 and a.ca_hash <= 954
;
