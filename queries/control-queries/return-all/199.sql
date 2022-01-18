select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,household_demographics hd,date_dim d,item i
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 568 and cs.cs_hash <= 968 and cd.cd_hash >= 208 and cd.cd_hash <= 541 and d.d_hash >= 107 and d.d_hash <= 857
;
