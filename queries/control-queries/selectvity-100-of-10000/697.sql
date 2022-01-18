select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 562 and c.c_hash <= 762 and a.ca_hash >= 781 and a.ca_hash <= 881 and hd.hd_hash >= 493 and hd.hd_hash <= 993
;
