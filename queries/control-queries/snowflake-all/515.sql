select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer_demographics cd,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 36 and d.d_hash <= 786 and cd.cd_hash >= 196 and cd.cd_hash <= 596 and hd.hd_hash >= 270 and hd.hd_hash <= 603
;
