select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 40 and ss.ss_hash <= 373 and i.i_hash >= 509 and i.i_hash <= 909 and c.c_hash >= 139 and c.c_hash <= 889
;
