select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,item i,date_dim d,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 25 and cs.cs_hash <= 775 and d.d_hash >= 420 and d.d_hash <= 753 and hd.hd_hash >= 284 and hd.hd_hash <= 684
;
