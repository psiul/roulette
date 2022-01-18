select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 535 and hd.hd_hash <= 935 and a.ca_hash >= 110 and a.ca_hash <= 860 and cd.cd_hash >= 385 and cd.cd_hash <= 718
;
