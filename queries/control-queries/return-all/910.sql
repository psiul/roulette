select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,date_dim d,customer_demographics cd,warehouse w
where cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 477 and cs.cs_hash <= 877 and d.d_hash >= 428 and d.d_hash <= 761 and cd.cd_hash >= 110 and cd.cd_hash <= 860
;
