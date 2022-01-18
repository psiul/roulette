select count(cs.cs_item_sk)
from catalog_sales cs,customer_demographics cd,household_demographics hd,warehouse w,date_dim d
where cs.cs_bill_cdemo_sk = cd.cd_demo_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 579 and cs.cs_hash <= 912 and hd.hd_hash >= 104 and hd.hd_hash <= 854 and d.d_hash >= 518 and d.d_hash <= 918
;
