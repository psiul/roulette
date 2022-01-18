select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,date_dim d,ship_mode sm,customer_demographics cd
where cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 157 and d.d_hash <= 907 and sm.sm_hash >= 124 and sm.sm_hash <= 457 and cd.cd_hash >= 28 and cd.cd_hash <= 428
;
