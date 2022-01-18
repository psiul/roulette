select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,ship_mode sm,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 331 and cs.cs_hash <= 664 and d.d_hash >= 169 and d.d_hash <= 569 and sm.sm_hash >= 190 and sm.sm_hash <= 940
;
