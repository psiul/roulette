select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 528 and hd.hd_hash <= 628 and cd.cd_hash >= 581 and cd.cd_hash <= 781 and c.c_hash >= 91 and c.c_hash <= 141
;
