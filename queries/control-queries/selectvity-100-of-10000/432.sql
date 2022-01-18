select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 758 and cd.cd_hash <= 958 and hd.hd_hash >= 872 and hd.hd_hash <= 972 and a.ca_hash >= 70 and a.ca_hash <= 570
;
