select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,item i,customer c
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 200 and cs.cs_hash <= 950 and d.d_hash >= 177 and d.d_hash <= 510 and c.c_hash >= 29 and c.c_hash <= 429
;
