select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,household_demographics hd,item i
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 234 and cs.cs_hash <= 984 and d.d_hash >= 88 and d.d_hash <= 488 and hd.hd_hash >= 495 and hd.hd_hash <= 828
;
