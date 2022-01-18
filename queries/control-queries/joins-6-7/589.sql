select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 220 and cd.cd_hash <= 970 and hd.hd_hash >= 87 and hd.hd_hash <= 487 and i.i_hash >= 29 and i.i_hash <= 362
;
