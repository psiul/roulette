select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 103 and ss.ss_hash <= 303 and a.ca_hash >= 250 and a.ca_hash <= 300 and cd.cd_hash >= 214 and cd.cd_hash <= 314
;
