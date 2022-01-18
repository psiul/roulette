select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,customer_demographics cd,catalog_returns cr
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and sm.sm_hash >= 483 and sm.sm_hash <= 816 and d.d_hash >= 169 and d.d_hash <= 919 and cd.cd_hash >= 319 and cd.cd_hash <= 719
;
