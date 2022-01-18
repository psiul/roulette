select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 91 and i.i_hash <= 491 and d.d_hash >= 178 and d.d_hash <= 511 and cd.cd_hash >= 170 and cd.cd_hash <= 920
;
