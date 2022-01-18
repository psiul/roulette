select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,ship_mode sm,catalog_returns cr,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cd.cd_hash >= 371 and cd.cd_hash <= 704 and sm.sm_hash >= 418 and sm.sm_hash <= 818 and d.d_hash >= 244 and d.d_hash <= 994
;
