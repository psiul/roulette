select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,date_dim d,customer_demographics cd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 205 and cs.cs_hash <= 955 and c.c_hash >= 152 and c.c_hash <= 552 and hd.hd_hash >= 492 and hd.hd_hash <= 825
;
