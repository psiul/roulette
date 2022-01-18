select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,catalog_returns cr,date_dim d,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 109 and cs.cs_hash <= 509 and d.d_hash >= 529 and d.d_hash <= 862 and sm.sm_hash >= 154 and sm.sm_hash <= 904
;
