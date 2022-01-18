select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,warehouse w,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 465 and cs.cs_hash <= 865 and cd.cd_hash >= 150 and cd.cd_hash <= 900 and i.i_hash >= 59 and i.i_hash <= 392
;
