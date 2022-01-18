select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 757 and hd.hd_hash <= 957 and c.c_hash >= 514 and c.c_hash <= 614 and a.ca_hash >= 379 and a.ca_hash <= 879
;
