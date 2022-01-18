select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,warehouse w,customer_demographics cd,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 409 and cs.cs_hash <= 809 and hd.hd_hash >= 174 and hd.hd_hash <= 507 and d.d_hash >= 214 and d.d_hash <= 964
;
