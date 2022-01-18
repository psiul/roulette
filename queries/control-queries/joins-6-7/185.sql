select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and a.ca_hash >= 291 and a.ca_hash <= 691 and cd.cd_hash >= 223 and cd.cd_hash <= 556 and i.i_hash >= 214 and i.i_hash <= 964
;
