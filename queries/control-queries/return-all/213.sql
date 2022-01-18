select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,catalog_returns cr,item i
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 291 and cs.cs_hash <= 624 and d.d_hash >= 433 and d.d_hash <= 833 and i.i_hash >= 171 and i.i_hash <= 921
;
