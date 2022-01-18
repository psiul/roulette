select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 623 and ss.ss_hash <= 643 and hd.hd_hash >= 740 and hd.hd_hash <= 840 and c.c_hash >= 900 and c.c_hash <= 950
;
