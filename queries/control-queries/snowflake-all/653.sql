select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,item i,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and hd.hd_hash >= 216 and hd.hd_hash <= 966 and i.i_hash >= 388 and i.i_hash <= 788 and d.d_hash >= 360 and d.d_hash <= 693
;
