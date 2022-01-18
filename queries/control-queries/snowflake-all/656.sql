select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,customer_demographics cd,ship_mode sm
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 214 and cs.cs_hash <= 964 and hd.hd_hash >= 255 and hd.hd_hash <= 655 and cd.cd_hash >= 9 and cd.cd_hash <= 342
;
