select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,warehouse w,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 27 and cs.cs_hash <= 777 and d.d_hash >= 218 and d.d_hash <= 551 and i.i_hash >= 58 and i.i_hash <= 458
;
