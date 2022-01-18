select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_address a,customer_demographics cd,item i
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and c.c_hash >= 440 and c.c_hash <= 840 and a.ca_hash >= 555 and a.ca_hash <= 888 and i.i_hash >= 241 and i.i_hash <= 991
;
