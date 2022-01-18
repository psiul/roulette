select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 713 and c.c_hash <= 813 and cd.cd_hash >= 96 and cd.cd_hash <= 146 and a.ca_hash >= 908 and a.ca_hash <= 928
;
