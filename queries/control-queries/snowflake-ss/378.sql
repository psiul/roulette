select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 380 and ss.ss_hash <= 780 and c.c_hash >= 11 and c.c_hash <= 761 and cd.cd_hash >= 329 and cd.cd_hash <= 662
;
