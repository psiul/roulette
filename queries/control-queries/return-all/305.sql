select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,date_dim d,warehouse w,customer_demographics cd
where cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 558 and cs.cs_hash <= 891 and d.d_hash >= 43 and d.d_hash <= 443 and cd.cd_hash >= 68 and cd.cd_hash <= 818
;
