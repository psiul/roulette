select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,customer c,catalog_returns cr
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 585 and cs.cs_hash <= 918 and cd.cd_hash >= 101 and cd.cd_hash <= 851 and c.c_hash >= 373 and c.c_hash <= 773
;
