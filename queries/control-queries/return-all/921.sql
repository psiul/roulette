select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,item i,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 129 and cs.cs_hash <= 462 and d.d_hash >= 105 and d.d_hash <= 855 and i.i_hash >= 522 and i.i_hash <= 922
;
