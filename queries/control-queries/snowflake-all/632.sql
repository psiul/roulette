select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 44 and cd.cd_hash <= 444 and d.d_hash >= 660 and d.d_hash <= 993 and a.ca_hash >= 131 and a.ca_hash <= 881
;
