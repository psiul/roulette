select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 691 and ss.ss_hash <= 791 and d.d_hash >= 238 and d.d_hash <= 288 and c.c_hash >= 241 and c.c_hash <= 441
;
