select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 182 and hd.hd_hash <= 932 and a.ca_hash >= 204 and a.ca_hash <= 537 and cd.cd_hash >= 215 and cd.cd_hash <= 615
;
