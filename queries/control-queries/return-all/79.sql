select count(cs.cs_item_sk)
from catalog_sales cs,warehouse w,catalog_returns cr,item i,household_demographics hd
where cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 166 and cs.cs_hash <= 916 and i.i_hash >= 143 and i.i_hash <= 543 and hd.hd_hash >= 89 and hd.hd_hash <= 422
;
