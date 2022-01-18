select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,item i,date_dim d,warehouse w
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 365 and cs.cs_hash <= 698 and cd.cd_hash >= 116 and cd.cd_hash <= 866 and i.i_hash >= 17 and i.i_hash <= 417
;
