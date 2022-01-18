select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 171 and ss.ss_hash <= 921 and hd.hd_hash >= 599 and hd.hd_hash <= 932 and a.ca_hash >= 287 and a.ca_hash <= 687
;
