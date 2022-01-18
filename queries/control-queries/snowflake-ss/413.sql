select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 195 and ss.ss_hash <= 528 and c.c_hash >= 116 and c.c_hash <= 516 and cd.cd_hash >= 190 and cd.cd_hash <= 940
;
