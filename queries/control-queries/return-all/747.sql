select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,warehouse w,customer_demographics cd,date_dim d
where cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 244 and cs.cs_hash <= 994 and cd.cd_hash >= 453 and cd.cd_hash <= 786 and d.d_hash >= 233 and d.d_hash <= 633
;
