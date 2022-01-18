select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,date_dim d,warehouse w
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 238 and cs.cs_hash <= 988 and i.i_hash >= 232 and i.i_hash <= 565 and d.d_hash >= 50 and d.d_hash <= 450
;
