select count(cs.cs_item_sk)
from catalog_sales cs,item i,warehouse w,household_demographics hd,date_dim d
where cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 209 and cs.cs_hash <= 959 and hd.hd_hash >= 464 and hd.hd_hash <= 864 and d.d_hash >= 366 and d.d_hash <= 699
;
