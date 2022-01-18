select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,catalog_returns cr,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 180 and cs.cs_hash <= 930 and i.i_hash >= 153 and i.i_hash <= 553 and hd.hd_hash >= 417 and hd.hd_hash <= 750
;
