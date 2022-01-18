select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 92 and ss.ss_hash <= 292 and d.d_hash >= 850 and d.d_hash <= 950 and c.c_hash >= 81 and c.c_hash <= 581
;
