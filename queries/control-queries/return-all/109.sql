select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,item i,warehouse w
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 64 and cs.cs_hash <= 814 and hd.hd_hash >= 78 and hd.hd_hash <= 411 and i.i_hash >= 228 and i.i_hash <= 628
;
