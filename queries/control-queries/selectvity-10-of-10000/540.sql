select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 710 and ss.ss_hash <= 910 and c.c_hash >= 680 and c.c_hash <= 780 and a.ca_hash >= 268 and a.ca_hash <= 318
;
