select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,customer c,household_demographics hd,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 242 and cs.cs_hash <= 642 and hd.hd_hash >= 617 and hd.hd_hash <= 950 and d.d_hash >= 151 and d.d_hash <= 901
;
