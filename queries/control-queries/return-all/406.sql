select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,catalog_returns cr,item i,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_item_sk = i.i_item_sk and cr.cr_refunded_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 105 and hd.hd_hash <= 855 and i.i_hash >= 473 and i.i_hash <= 806 and cd.cd_hash >= 307 and cd.cd_hash <= 707
;
