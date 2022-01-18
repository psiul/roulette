select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 73 and c.c_hash <= 823 and cd.cd_hash >= 123 and cd.cd_hash <= 456 and a.ca_hash >= 35 and a.ca_hash <= 435
;
