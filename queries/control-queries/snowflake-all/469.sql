select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,ship_mode sm,customer_demographics cd,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 183 and cs.cs_hash <= 933 and sm.sm_hash >= 182 and sm.sm_hash <= 515 and d.d_hash >= 407 and d.d_hash <= 807
;
