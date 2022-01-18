select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,warehouse w,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 458 and cs.cs_hash <= 791 and hd.hd_hash >= 352 and hd.hd_hash <= 752 and i.i_hash >= 162 and i.i_hash <= 912
;
