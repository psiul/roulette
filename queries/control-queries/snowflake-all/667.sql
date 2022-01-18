select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer_demographics cd,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 253 and cs.cs_hash <= 653 and d.d_hash >= 480 and d.d_hash <= 813 and hd.hd_hash >= 41 and hd.hd_hash <= 791
;
