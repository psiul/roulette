select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 649 and ss.ss_hash <= 982 and hd.hd_hash >= 462 and hd.hd_hash <= 862 and c.c_hash >= 164 and c.c_hash <= 914
;
