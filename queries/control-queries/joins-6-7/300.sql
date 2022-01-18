select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 85 and ss.ss_hash <= 835 and c.c_hash >= 127 and c.c_hash <= 527 and cd.cd_hash >= 317 and cd.cd_hash <= 650
;
