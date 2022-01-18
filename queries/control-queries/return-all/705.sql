select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 119 and ss.ss_hash <= 869 and hd.hd_hash >= 292 and hd.hd_hash <= 692 and a.ca_hash >= 401 and a.ca_hash <= 734
;
