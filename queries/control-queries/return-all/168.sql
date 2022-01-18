select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,customer c,catalog_returns cr
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and cd.cd_hash >= 242 and cd.cd_hash <= 992 and i.i_hash >= 328 and i.i_hash <= 661 and c.c_hash >= 347 and c.c_hash <= 747
;
