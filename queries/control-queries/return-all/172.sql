select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,item i,customer_demographics cd,customer c
where cs.cs_order_number = cr.cr_order_number and cs.cs_item_sk = i.i_item_sk and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 277 and cs.cs_hash <= 610 and cd.cd_hash >= 136 and cd.cd_hash <= 886 and c.c_hash >= 160 and c.c_hash <= 560
;
