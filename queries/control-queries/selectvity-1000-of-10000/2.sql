select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 43 and hd.hd_hash <= 793 and a.ca_hash >= 254 and a.ca_hash <= 654 and cd.cd_hash >= 65 and cd.cd_hash <= 398
;
