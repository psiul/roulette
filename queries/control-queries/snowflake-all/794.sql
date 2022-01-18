select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_demographics cd,date_dim d,ship_mode sm
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 146 and cs.cs_hash <= 479 and d.d_hash >= 211 and d.d_hash <= 961 and sm.sm_hash >= 432 and sm.sm_hash <= 832
;
