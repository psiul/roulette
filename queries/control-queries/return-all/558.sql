select count(cs.cs_item_sk)
from catalog_sales cs,customer c,item i,customer_demographics cd,customer_address a
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 574 and c.c_hash <= 907 and i.i_hash >= 31 and i.i_hash <= 781 and cd.cd_hash >= 12 and cd.cd_hash <= 412
;
