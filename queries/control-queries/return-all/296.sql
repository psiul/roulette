select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,household_demographics hd,warehouse w
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and d.d_hash >= 186 and d.d_hash <= 936 and i.i_hash >= 67 and i.i_hash <= 400 and hd.hd_hash >= 84 and hd.hd_hash <= 484
;
