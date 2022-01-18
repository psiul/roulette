select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer_demographics cd,date_dim d,catalog_returns cr
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 311 and cs.cs_hash <= 711 and cd.cd_hash >= 403 and cd.cd_hash <= 736 and d.d_hash >= 160 and d.d_hash <= 910
;
