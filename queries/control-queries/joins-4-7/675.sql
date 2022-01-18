select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 9 and ss.ss_hash <= 759 and c.c_hash >= 311 and c.c_hash <= 644 and a.ca_hash >= 513 and a.ca_hash <= 913
;
