select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,date_dim d,item i,ship_mode sm
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 169 and cs.cs_hash <= 919 and cd.cd_hash >= 576 and cd.cd_hash <= 976 and sm.sm_hash >= 420 and sm.sm_hash <= 753
;
