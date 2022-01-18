select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer_demographics cd,catalog_returns cr
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and d.d_hash >= 222 and d.d_hash <= 622 and sm.sm_hash >= 343 and sm.sm_hash <= 676 and cd.cd_hash >= 224 and cd.cd_hash <= 974
;
