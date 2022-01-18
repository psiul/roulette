select count(cs.cs_item_sk)
from catalog_sales cs,item i,warehouse w,date_dim d,customer_demographics cd
where cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 81 and cs.cs_hash <= 831 and i.i_hash >= 482 and i.i_hash <= 882 and d.d_hash >= 152 and d.d_hash <= 485
;
