select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 805 and cd.cd_hash <= 855 and a.ca_hash >= 382 and a.ca_hash <= 482 and hd.hd_hash >= 258 and hd.hd_hash <= 278
;
