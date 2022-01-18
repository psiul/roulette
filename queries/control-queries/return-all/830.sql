select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,catalog_returns cr,date_dim d,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and hd.hd_hash >= 258 and hd.hd_hash <= 658 and d.d_hash >= 189 and d.d_hash <= 522 and i.i_hash >= 117 and i.i_hash <= 867
;
