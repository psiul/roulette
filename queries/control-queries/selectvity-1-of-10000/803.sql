select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 803 and hd.hd_hash <= 903 and c.c_hash >= 616 and c.c_hash <= 636 and cd.cd_hash >= 183 and cd.cd_hash <= 233
;
