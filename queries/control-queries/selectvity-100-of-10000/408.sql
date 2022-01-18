select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_address a,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 487 and d.d_hash <= 987 and a.ca_hash >= 744 and a.ca_hash <= 944 and cd.cd_hash >= 858 and cd.cd_hash <= 958
;
