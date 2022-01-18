select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 244 and ss.ss_hash <= 994 and hd.hd_hash >= 379 and hd.hd_hash <= 712 and c.c_hash >= 479 and c.c_hash <= 879
;
