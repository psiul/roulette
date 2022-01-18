select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,customer_demographics cd,household_demographics hd
where cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 165 and cs.cs_hash <= 915 and i.i_hash >= 253 and i.i_hash <= 586 and d.d_hash >= 243 and d.d_hash <= 643
;
