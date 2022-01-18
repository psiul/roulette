select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 24 and ss.ss_hash <= 774 and hd.hd_hash >= 33 and hd.hd_hash <= 366 and d.d_hash >= 358 and d.d_hash <= 758
;
