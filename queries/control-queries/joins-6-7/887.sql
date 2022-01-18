select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 58 and hd.hd_hash <= 391 and i.i_hash >= 30 and i.i_hash <= 780 and cd.cd_hash >= 495 and cd.cd_hash <= 895
;
