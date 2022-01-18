select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 147 and c.c_hash <= 347 and hd.hd_hash >= 418 and hd.hd_hash <= 518 and a.ca_hash >= 443 and a.ca_hash <= 943
;
