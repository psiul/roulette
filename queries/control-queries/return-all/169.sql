select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer_demographics cd,catalog_returns cr,date_dim d
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_hash >= 539 and cs.cs_hash <= 939 and cd.cd_hash >= 228 and cd.cd_hash <= 978 and d.d_hash >= 325 and d.d_hash <= 658
;
