select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,customer_demographics cd,catalog_returns cr
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 34 and cs.cs_hash <= 367 and d.d_hash >= 118 and d.d_hash <= 868 and cd.cd_hash >= 454 and cd.cd_hash <= 854
;
