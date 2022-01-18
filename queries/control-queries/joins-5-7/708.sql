select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 107 and ss.ss_hash <= 507 and hd.hd_hash >= 612 and hd.hd_hash <= 945 and d.d_hash >= 193 and d.d_hash <= 943
;
