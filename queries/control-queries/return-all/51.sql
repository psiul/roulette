select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,warehouse w,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 537 and cs.cs_hash <= 937 and i.i_hash >= 536 and i.i_hash <= 869 and hd.hd_hash >= 98 and hd.hd_hash <= 848
;
