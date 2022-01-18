select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 392 and ss.ss_hash <= 792 and d.d_hash >= 612 and d.d_hash <= 945 and c.c_hash >= 214 and c.c_hash <= 964
;
