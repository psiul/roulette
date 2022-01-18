select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,catalog_returns cr,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 552 and hd.hd_hash <= 952 and d.d_hash >= 223 and d.d_hash <= 973 and cd.cd_hash >= 495 and cd.cd_hash <= 828
;
