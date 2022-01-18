select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer_demographics cd,household_demographics hd,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 0 and cs.cs_hash <= 400 and d.d_hash >= 134 and d.d_hash <= 884 and c.c_hash >= 434 and c.c_hash <= 767
;
