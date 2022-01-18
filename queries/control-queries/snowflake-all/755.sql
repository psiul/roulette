select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer c,customer_demographics cd,warehouse w
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 45 and cs.cs_hash <= 795 and i.i_hash >= 198 and i.i_hash <= 531 and c.c_hash >= 197 and c.c_hash <= 597
;
