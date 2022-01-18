select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,catalog_returns cr,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 227 and cs.cs_hash <= 977 and d.d_hash >= 282 and d.d_hash <= 615 and sm.sm_hash >= 116 and sm.sm_hash <= 516
;
