select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 89 and c.c_hash <= 139 and hd.hd_hash >= 488 and hd.hd_hash <= 688 and cd.cd_hash >= 481 and cd.cd_hash <= 581
;
