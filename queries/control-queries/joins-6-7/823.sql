select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 423 and ss.ss_hash <= 756 and c.c_hash >= 5 and c.c_hash <= 405 and hd.hd_hash >= 111 and hd.hd_hash <= 861
;
