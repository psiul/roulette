select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 187 and c.c_hash <= 520 and hd.hd_hash >= 201 and hd.hd_hash <= 601 and cd.cd_hash >= 206 and cd.cd_hash <= 956
;
