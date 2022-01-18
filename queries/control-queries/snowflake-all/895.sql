select count(cs.cs_item_sk)
from catalog_sales cs,customer c,date_dim d,item i,warehouse w
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 408 and cs.cs_hash <= 808 and c.c_hash >= 153 and c.c_hash <= 486 and d.d_hash >= 117 and d.d_hash <= 867
;
