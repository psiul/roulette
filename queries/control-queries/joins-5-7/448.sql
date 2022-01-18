select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 568 and cd.cd_hash <= 968 and a.ca_hash >= 223 and a.ca_hash <= 973 and i.i_hash >= 602 and i.i_hash <= 935
;
