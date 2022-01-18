select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,warehouse w,item i
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 76 and cs.cs_hash <= 476 and d.d_hash >= 222 and d.d_hash <= 972 and i.i_hash >= 647 and i.i_hash <= 980
;
