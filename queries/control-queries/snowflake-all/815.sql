select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer_demographics cd,household_demographics hd,date_dim d
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 240 and cs.cs_hash <= 990 and hd.hd_hash >= 566 and hd.hd_hash <= 966 and d.d_hash >= 73 and d.d_hash <= 406
;
