select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 745 and ss.ss_hash <= 845 and cd.cd_hash >= 780 and cd.cd_hash <= 830 and c.c_hash >= 879 and c.c_hash <= 899
;
