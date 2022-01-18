select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 546 and c.c_hash <= 879 and a.ca_hash >= 166 and a.ca_hash <= 916 and hd.hd_hash >= 412 and hd.hd_hash <= 812
;
