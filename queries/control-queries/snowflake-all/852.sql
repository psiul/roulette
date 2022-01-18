select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,ship_mode sm,customer c,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 649 and cs.cs_hash <= 982 and d.d_hash >= 113 and d.d_hash <= 863 and sm.sm_hash >= 446 and sm.sm_hash <= 846
;
