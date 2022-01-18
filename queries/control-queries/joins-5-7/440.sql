select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 65 and ss.ss_hash <= 815 and hd.hd_hash >= 358 and hd.hd_hash <= 691 and c.c_hash >= 389 and c.c_hash <= 789
;
