select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 131 and c.c_hash <= 464 and a.ca_hash >= 186 and a.ca_hash <= 936 and cd.cd_hash >= 418 and cd.cd_hash <= 818
;
