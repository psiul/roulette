select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 236 and i.i_hash <= 569 and hd.hd_hash >= 78 and hd.hd_hash <= 478 and a.ca_hash >= 228 and a.ca_hash <= 978
;
