select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,warehouse w,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 446 and cs.cs_hash <= 779 and i.i_hash >= 54 and i.i_hash <= 804 and c.c_hash >= 296 and c.c_hash <= 696
;
