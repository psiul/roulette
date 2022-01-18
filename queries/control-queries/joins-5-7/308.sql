select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and a.ca_hash >= 187 and a.ca_hash <= 937 and cd.cd_hash >= 357 and cd.cd_hash <= 690 and hd.hd_hash >= 495 and hd.hd_hash <= 895
;
