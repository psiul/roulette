select count(cs.cs_item_sk)
from catalog_sales cs,ship_mode sm,customer c,date_dim d,warehouse w
where cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 180 and cs.cs_hash <= 580 and c.c_hash >= 404 and c.c_hash <= 737 and d.d_hash >= 229 and d.d_hash <= 979
;
