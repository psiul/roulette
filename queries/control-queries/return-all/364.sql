select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer_demographics cd,date_dim d,ship_mode sm
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 505 and cs.cs_hash <= 905 and cd.cd_hash >= 208 and cd.cd_hash <= 958 and sm.sm_hash >= 187 and sm.sm_hash <= 520
;
