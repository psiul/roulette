select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,warehouse w,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 310 and cs.cs_hash <= 643 and cd.cd_hash >= 375 and cd.cd_hash <= 775 and i.i_hash >= 48 and i.i_hash <= 798
;
