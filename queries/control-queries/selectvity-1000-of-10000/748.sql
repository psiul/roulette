select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 310 and c.c_hash <= 643 and hd.hd_hash >= 13 and hd.hd_hash <= 763 and d.d_hash >= 25 and d.d_hash <= 425
;
