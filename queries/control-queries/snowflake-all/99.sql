select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,household_demographics hd,warehouse w
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_hash >= 68 and cs.cs_hash <= 468 and i.i_hash >= 90 and i.i_hash <= 840 and hd.hd_hash >= 342 and hd.hd_hash <= 675
;
