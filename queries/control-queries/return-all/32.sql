select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,catalog_returns cr,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 301 and cs.cs_hash <= 701 and d.d_hash >= 237 and d.d_hash <= 987 and i.i_hash >= 466 and i.i_hash <= 799
;
