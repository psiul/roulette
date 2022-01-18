select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,customer_demographics cd,item i
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and d.d_hash >= 443 and d.d_hash <= 843 and cd.cd_hash >= 166 and cd.cd_hash <= 499 and i.i_hash >= 5 and i.i_hash <= 755
;
