select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer_demographics cd,item i,customer c
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cr.cr_item_sk = i.i_item_sk and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 110 and cs.cs_hash <= 510 and cd.cd_hash >= 424 and cd.cd_hash <= 757 and i.i_hash >= 98 and i.i_hash <= 848
;
