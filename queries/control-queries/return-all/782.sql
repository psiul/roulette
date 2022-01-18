select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,catalog_returns cr,household_demographics hd,customer_demographics cd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 585 and cs.cs_hash <= 985 and d.d_hash >= 191 and d.d_hash <= 941 and cd.cd_hash >= 491 and cd.cd_hash <= 824
;
