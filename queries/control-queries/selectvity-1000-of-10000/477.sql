select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 633 and ss.ss_hash <= 966 and c.c_hash >= 131 and c.c_hash <= 881 and cd.cd_hash >= 133 and cd.cd_hash <= 533
;
