select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,customer_demographics cd,date_dim d,item i
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 358 and cs.cs_hash <= 691 and cd.cd_hash >= 83 and cd.cd_hash <= 483 and d.d_hash >= 41 and d.d_hash <= 791
;
