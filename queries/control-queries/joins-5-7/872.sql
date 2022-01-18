select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 108 and ss.ss_hash <= 858 and c.c_hash >= 302 and c.c_hash <= 702 and hd.hd_hash >= 282 and hd.hd_hash <= 615
;
