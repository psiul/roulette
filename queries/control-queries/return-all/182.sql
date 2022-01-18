select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,customer c,household_demographics hd,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 646 and cs.cs_hash <= 979 and c.c_hash >= 407 and c.c_hash <= 807 and d.d_hash >= 182 and d.d_hash <= 932
;
