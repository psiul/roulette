select count(cs.cs_item_sk)
from catalog_sales cs,item i,household_demographics hd,warehouse w,date_dim d
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 367 and cs.cs_hash <= 767 and i.i_hash >= 51 and i.i_hash <= 801 and d.d_hash >= 429 and d.d_hash <= 762
;
