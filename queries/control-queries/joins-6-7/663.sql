select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 286 and ss.ss_hash <= 686 and c.c_hash >= 163 and c.c_hash <= 913 and i.i_hash >= 116 and i.i_hash <= 449
;