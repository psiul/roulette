select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 147 and ss.ss_hash <= 480 and c.c_hash >= 87 and c.c_hash <= 837 and cd.cd_hash >= 164 and cd.cd_hash <= 564
;
