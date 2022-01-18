select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 544 and ss.ss_hash <= 944 and cd.cd_hash >= 418 and cd.cd_hash <= 751 and a.ca_hash >= 138 and a.ca_hash <= 888
;
