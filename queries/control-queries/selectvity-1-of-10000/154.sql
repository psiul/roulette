select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 768 and d.d_hash <= 788 and hd.hd_hash >= 18 and hd.hd_hash <= 68 and cd.cd_hash >= 171 and cd.cd_hash <= 271
;
