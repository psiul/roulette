select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,item i,customer_demographics cd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 130 and d.d_hash <= 463 and i.i_hash >= 384 and i.i_hash <= 784 and cd.cd_hash >= 15 and cd.cd_hash <= 765
;
