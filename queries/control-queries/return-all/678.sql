select count(cs.cs_item_sk)
from catalog_sales cs,item i,warehouse w,date_dim d,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 271 and i.i_hash <= 671 and d.d_hash >= 199 and d.d_hash <= 949 and hd.hd_hash >= 458 and hd.hd_hash <= 791
;
