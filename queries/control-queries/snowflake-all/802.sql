select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,customer_demographics cd,warehouse w
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 439 and cs.cs_hash <= 839 and d.d_hash >= 164 and d.d_hash <= 914 and cd.cd_hash >= 48 and cd.cd_hash <= 381
;
