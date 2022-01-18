select count(cs.cs_item_sk)
from catalog_sales cs,customer c,date_dim d,warehouse w,ship_mode sm
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and c.c_hash >= 24 and c.c_hash <= 774 and d.d_hash >= 43 and d.d_hash <= 443 and sm.sm_hash >= 389 and sm.sm_hash <= 722
;
