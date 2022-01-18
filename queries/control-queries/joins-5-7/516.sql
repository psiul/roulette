select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 153 and cd.cd_hash <= 903 and hd.hd_hash >= 227 and hd.hd_hash <= 627 and a.ca_hash >= 125 and a.ca_hash <= 458
;
