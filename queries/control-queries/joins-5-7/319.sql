select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 427 and hd.hd_hash <= 760 and a.ca_hash >= 147 and a.ca_hash <= 897 and cd.cd_hash >= 285 and cd.cd_hash <= 685
;
