select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,catalog_returns cr,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 59 and cs.cs_hash <= 809 and cd.cd_hash >= 149 and cd.cd_hash <= 482 and d.d_hash >= 536 and d.d_hash <= 936
;
