select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,household_demographics hd,date_dim d,item i
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 494 and cs.cs_hash <= 827 and hd.hd_hash >= 162 and hd.hd_hash <= 912 and d.d_hash >= 484 and d.d_hash <= 884
;
