select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 589 and ss.ss_hash <= 922 and d.d_hash >= 327 and d.d_hash <= 727 and hd.hd_hash >= 49 and hd.hd_hash <= 799
;
