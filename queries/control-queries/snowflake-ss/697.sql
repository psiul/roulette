select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 336 and ss.ss_hash <= 736 and c.c_hash >= 112 and c.c_hash <= 862 and cd.cd_hash >= 344 and cd.cd_hash <= 677
;
