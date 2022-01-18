select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,catalog_returns cr,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_hash >= 29 and cs.cs_hash <= 429 and cd.cd_hash >= 245 and cd.cd_hash <= 995 and d.d_hash >= 304 and d.d_hash <= 637
;
