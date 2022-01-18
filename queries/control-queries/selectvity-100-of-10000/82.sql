select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 233 and c.c_hash <= 733 and a.ca_hash >= 170 and a.ca_hash <= 270 and cd.cd_hash >= 659 and cd.cd_hash <= 859
;
