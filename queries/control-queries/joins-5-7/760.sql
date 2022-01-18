select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 432 and ss.ss_hash <= 832 and c.c_hash >= 622 and c.c_hash <= 955 and a.ca_hash >= 71 and a.ca_hash <= 821
;
