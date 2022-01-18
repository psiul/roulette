select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,catalog_returns cr,date_dim d,customer c
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_ship_date_sk = d.d_date_sk and cr.cr_refunded_customer_sk = c.c_customer_sk and cd.cd_hash >= 112 and cd.cd_hash <= 862 and d.d_hash >= 540 and d.d_hash <= 940 and c.c_hash >= 263 and c.c_hash <= 596
;
