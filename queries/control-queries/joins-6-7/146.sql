select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 442 and ss.ss_hash <= 775 and c.c_hash >= 65 and c.c_hash <= 815 and d.d_hash >= 126 and d.d_hash <= 526
;
