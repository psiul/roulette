select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,customer_demographics cd,catalog_returns cr
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 177 and cs.cs_hash <= 510 and d.d_hash >= 132 and d.d_hash <= 882 and cd.cd_hash >= 94 and cd.cd_hash <= 494
;
