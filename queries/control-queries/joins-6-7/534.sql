select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_address a,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 4 and i.i_hash <= 754 and d.d_hash >= 496 and d.d_hash <= 896 and a.ca_hash >= 247 and a.ca_hash <= 580
;
