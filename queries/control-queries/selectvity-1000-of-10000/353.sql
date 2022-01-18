select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 273 and ss.ss_hash <= 673 and c.c_hash >= 220 and c.c_hash <= 553 and d.d_hash >= 232 and d.d_hash <= 982
;
