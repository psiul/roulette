select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,item i,catalog_returns cr
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 456 and cs.cs_hash <= 856 and d.d_hash >= 475 and d.d_hash <= 808 and hd.hd_hash >= 139 and hd.hd_hash <= 889
;
