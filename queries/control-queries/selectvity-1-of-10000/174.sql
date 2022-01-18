select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 918 and ss.ss_hash <= 968 and cd.cd_hash >= 712 and cd.cd_hash <= 812 and a.ca_hash >= 836 and a.ca_hash <= 856
;
