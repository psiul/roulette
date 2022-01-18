select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,warehouse w,item i,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 276 and cs.cs_hash <= 676 and d.d_hash >= 374 and d.d_hash <= 707 and i.i_hash >= 86 and i.i_hash <= 836
;
