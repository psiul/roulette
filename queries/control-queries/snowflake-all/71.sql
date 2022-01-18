select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,date_dim d,customer_demographics cd,household_demographics hd
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 241 and d.d_hash <= 641 and cd.cd_hash >= 276 and cd.cd_hash <= 609 and hd.hd_hash >= 215 and hd.hd_hash <= 965
;
