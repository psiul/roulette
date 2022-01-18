select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 96 and c.c_hash <= 846 and hd.hd_hash >= 619 and hd.hd_hash <= 952 and cd.cd_hash >= 293 and cd.cd_hash <= 693
;
