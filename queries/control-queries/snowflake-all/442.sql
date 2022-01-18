select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,date_dim d,customer_demographics cd
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 116 and hd.hd_hash <= 866 and d.d_hash >= 618 and d.d_hash <= 951 and cd.cd_hash >= 284 and cd.cd_hash <= 684
;
