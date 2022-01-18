select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,customer_demographics cd,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 34 and cs.cs_hash <= 434 and d.d_hash >= 509 and d.d_hash <= 842 and cd.cd_hash >= 12 and cd.cd_hash <= 762
;
