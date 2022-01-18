select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,household_demographics hd,customer_demographics cd,ship_mode sm
where cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 249 and cs.cs_hash <= 649 and hd.hd_hash >= 96 and hd.hd_hash <= 846 and cd.cd_hash >= 305 and cd.cd_hash <= 638
;
