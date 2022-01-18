select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 440 and d.d_hash <= 640 and c.c_hash >= 802 and c.c_hash <= 902 and cd.cd_hash >= 784 and cd.cd_hash <= 834
;
