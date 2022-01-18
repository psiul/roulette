select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 25 and ss.ss_hash <= 358 and a.ca_hash >= 41 and a.ca_hash <= 791 and cd.cd_hash >= 308 and cd.cd_hash <= 708
;
