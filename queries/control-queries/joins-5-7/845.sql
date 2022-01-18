select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 123 and ss.ss_hash <= 523 and cd.cd_hash >= 111 and cd.cd_hash <= 861 and a.ca_hash >= 397 and a.ca_hash <= 730
;
