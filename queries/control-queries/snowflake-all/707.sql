select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,date_dim d,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 110 and cs.cs_hash <= 443 and hd.hd_hash >= 381 and hd.hd_hash <= 781 and cd.cd_hash >= 182 and cd.cd_hash <= 932
;
