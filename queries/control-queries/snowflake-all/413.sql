select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,item i,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 23 and cs.cs_hash <= 423 and d.d_hash >= 217 and d.d_hash <= 967 and hd.hd_hash >= 392 and hd.hd_hash <= 725
;
