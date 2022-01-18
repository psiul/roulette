select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,household_demographics hd,date_dim d,customer_demographics cd
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 239 and cs.cs_hash <= 572 and d.d_hash >= 412 and d.d_hash <= 812 and cd.cd_hash >= 145 and cd.cd_hash <= 895
;
