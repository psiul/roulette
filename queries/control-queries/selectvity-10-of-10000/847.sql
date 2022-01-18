select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 186 and ss.ss_hash <= 286 and a.ca_hash >= 639 and a.ca_hash <= 839 and cd.cd_hash >= 482 and cd.cd_hash <= 532
;
