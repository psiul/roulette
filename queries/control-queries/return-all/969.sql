select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,date_dim d,warehouse w
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 92 and cs.cs_hash <= 492 and cd.cd_hash >= 103 and cd.cd_hash <= 853 and d.d_hash >= 298 and d.d_hash <= 631
;
