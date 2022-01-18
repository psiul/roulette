select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 566 and ss.ss_hash <= 899 and c.c_hash >= 164 and c.c_hash <= 914 and cd.cd_hash >= 207 and cd.cd_hash <= 607
;
