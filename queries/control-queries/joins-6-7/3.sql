select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 423 and ss.ss_hash <= 823 and hd.hd_hash >= 144 and hd.hd_hash <= 477 and c.c_hash >= 127 and c.c_hash <= 877
;
