select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 401 and ss.ss_hash <= 501 and hd.hd_hash >= 669 and hd.hd_hash <= 719 and cd.cd_hash >= 448 and cd.cd_hash <= 648
;
