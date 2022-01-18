select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 108 and ss.ss_hash <= 858 and hd.hd_hash >= 644 and hd.hd_hash <= 977 and cd.cd_hash >= 164 and cd.cd_hash <= 564
;
