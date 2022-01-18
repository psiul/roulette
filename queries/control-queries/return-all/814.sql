select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,warehouse w,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 343 and d.d_hash <= 676 and c.c_hash >= 225 and c.c_hash <= 625 and sm.sm_hash >= 221 and sm.sm_hash <= 971
;
