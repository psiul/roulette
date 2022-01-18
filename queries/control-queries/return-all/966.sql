select count(cs.cs_item_sk)
from catalog_sales cs,item i,warehouse w,date_dim d,customer_demographics cd
where cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 596 and cs.cs_hash <= 929 and i.i_hash >= 278 and i.i_hash <= 678 and d.d_hash >= 42 and d.d_hash <= 792
;
