select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,item i,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_hash >= 300 and cs.cs_hash <= 700 and i.i_hash >= 238 and i.i_hash <= 988 and cd.cd_hash >= 333 and cd.cd_hash <= 666
;
