select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer_demographics cd,household_demographics hd,date_dim d
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 48 and cs.cs_hash <= 448 and sm.sm_hash >= 118 and sm.sm_hash <= 451 and hd.hd_hash >= 2 and hd.hd_hash <= 752
;
