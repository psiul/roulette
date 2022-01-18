select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 194 and ss.ss_hash <= 944 and hd.hd_hash >= 470 and hd.hd_hash <= 870 and c.c_hash >= 438 and c.c_hash <= 771
;
