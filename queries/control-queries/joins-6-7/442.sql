select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_demographics cd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 207 and d.d_hash <= 957 and cd.cd_hash >= 505 and cd.cd_hash <= 838 and a.ca_hash >= 208 and a.ca_hash <= 608
;
