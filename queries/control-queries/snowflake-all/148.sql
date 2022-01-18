select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,warehouse w,item i,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 271 and cs.cs_hash <= 671 and cd.cd_hash >= 73 and cd.cd_hash <= 823 and d.d_hash >= 272 and d.d_hash <= 605
;
