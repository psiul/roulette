select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 0 and ss.ss_hash <= 750 and hd.hd_hash >= 175 and hd.hd_hash <= 508 and c.c_hash >= 215 and c.c_hash <= 615
;
