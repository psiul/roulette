select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 186 and c.c_hash <= 586 and a.ca_hash >= 542 and a.ca_hash <= 875 and i.i_hash >= 216 and i.i_hash <= 966
;
