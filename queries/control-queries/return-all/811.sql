select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,customer c,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 113 and cs.cs_hash <= 446 and c.c_hash >= 51 and c.c_hash <= 801 and hd.hd_hash >= 181 and hd.hd_hash <= 581
;
