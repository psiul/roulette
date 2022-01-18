select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 105 and ss.ss_hash <= 155 and c.c_hash >= 757 and c.c_hash <= 857 and cd.cd_hash >= 760 and cd.cd_hash <= 960
;
