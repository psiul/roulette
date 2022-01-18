select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 644 and d.d_hash <= 977 and hd.hd_hash >= 78 and hd.hd_hash <= 828 and c.c_hash >= 449 and c.c_hash <= 849
;
