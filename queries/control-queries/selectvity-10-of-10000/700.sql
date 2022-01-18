select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 467 and ss.ss_hash <= 667 and c.c_hash >= 9 and c.c_hash <= 109 and hd.hd_hash >= 192 and hd.hd_hash <= 242
;
