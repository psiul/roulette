select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,item i,customer_demographics cd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 26 and cs.cs_hash <= 776 and d.d_hash >= 314 and d.d_hash <= 714 and i.i_hash >= 183 and i.i_hash <= 516
;
