select count(cs.cs_item_sk)
from catalog_sales cs,item i,warehouse w,date_dim d,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 599 and cs.cs_hash <= 999 and i.i_hash >= 113 and i.i_hash <= 446 and hd.hd_hash >= 39 and hd.hd_hash <= 789
;
