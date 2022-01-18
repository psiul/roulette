select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,customer c,warehouse w
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 113 and cs.cs_hash <= 863 and i.i_hash >= 439 and i.i_hash <= 839 and d.d_hash >= 249 and d.d_hash <= 582
;
