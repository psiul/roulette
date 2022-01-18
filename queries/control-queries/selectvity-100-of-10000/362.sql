select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 434 and ss.ss_hash <= 934 and d.d_hash >= 546 and d.d_hash <= 646 and hd.hd_hash >= 750 and hd.hd_hash <= 950
;
