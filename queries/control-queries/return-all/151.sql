select count(cs.cs_item_sk)
from catalog_sales cs,item i,catalog_returns cr,warehouse w,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 128 and cs.cs_hash <= 878 and i.i_hash >= 168 and i.i_hash <= 501 and c.c_hash >= 69 and c.c_hash <= 469
;
