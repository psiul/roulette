select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 456 and ss.ss_hash <= 506 and c.c_hash >= 260 and c.c_hash <= 460 and cd.cd_hash >= 648 and cd.cd_hash <= 748
;
