select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,customer c,item i
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 376 and cs.cs_hash <= 776 and c.c_hash >= 86 and c.c_hash <= 836 and i.i_hash >= 593 and i.i_hash <= 926
;
