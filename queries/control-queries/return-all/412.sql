select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,warehouse w,catalog_returns cr
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 210 and cs.cs_hash <= 960 and cd.cd_hash >= 123 and cd.cd_hash <= 456 and d.d_hash >= 79 and d.d_hash <= 479
;
