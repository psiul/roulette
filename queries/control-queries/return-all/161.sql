select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer_demographics cd,date_dim d,ship_mode sm
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 453 and cs.cs_hash <= 786 and d.d_hash >= 446 and d.d_hash <= 846 and sm.sm_hash >= 45 and sm.sm_hash <= 795
;
