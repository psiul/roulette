select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,customer c,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 420 and cs.cs_hash <= 753 and d.d_hash >= 96 and d.d_hash <= 846 and cd.cd_hash >= 568 and cd.cd_hash <= 968
;
