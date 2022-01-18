select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,item i,warehouse w
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and d.d_hash >= 94 and d.d_hash <= 494 and cd.cd_hash >= 191 and cd.cd_hash <= 941 and i.i_hash >= 474 and i.i_hash <= 807
;
