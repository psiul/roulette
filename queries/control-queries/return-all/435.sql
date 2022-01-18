select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,catalog_returns cr,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 43 and cs.cs_hash <= 443 and cd.cd_hash >= 6 and cd.cd_hash <= 756 and i.i_hash >= 599 and i.i_hash <= 932
;
