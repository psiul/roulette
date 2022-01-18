select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 675 and ss.ss_hash <= 775 and a.ca_hash >= 797 and a.ca_hash <= 847 and cd.cd_hash >= 55 and cd.cd_hash <= 75
;
