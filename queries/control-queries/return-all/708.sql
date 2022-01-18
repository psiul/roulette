select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,catalog_returns cr,date_dim d,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 121 and cs.cs_hash <= 871 and d.d_hash >= 285 and d.d_hash <= 618 and i.i_hash >= 485 and i.i_hash <= 885
;
