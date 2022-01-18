select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,item i,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 220 and hd.hd_hash <= 620 and cd.cd_hash >= 195 and cd.cd_hash <= 945 and a.ca_hash >= 450 and a.ca_hash <= 783
;
