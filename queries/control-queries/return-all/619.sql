select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,date_dim d,item i
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 47 and cs.cs_hash <= 797 and cd.cd_hash >= 59 and cd.cd_hash <= 459 and d.d_hash >= 335 and d.d_hash <= 668
;
