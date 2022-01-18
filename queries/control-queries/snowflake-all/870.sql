select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,household_demographics hd,warehouse w
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 248 and cs.cs_hash <= 581 and d.d_hash >= 527 and d.d_hash <= 927 and i.i_hash >= 65 and i.i_hash <= 815
;
