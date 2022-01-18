select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,item i,customer_demographics cd,date_dim d
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 200 and cs.cs_hash <= 950 and cd.cd_hash >= 47 and cd.cd_hash <= 380 and d.d_hash >= 577 and d.d_hash <= 977
;
