select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,customer_demographics cd,item i
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 114 and cs.cs_hash <= 447 and d.d_hash >= 66 and d.d_hash <= 816 and cd.cd_hash >= 509 and cd.cd_hash <= 909
;
