select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,date_dim d,household_demographics hd,item i
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 155 and cs.cs_hash <= 488 and d.d_hash >= 151 and d.d_hash <= 901 and hd.hd_hash >= 41 and hd.hd_hash <= 441
;
