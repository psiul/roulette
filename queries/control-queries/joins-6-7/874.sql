select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 569 and i.i_hash <= 902 and d.d_hash >= 322 and d.d_hash <= 722 and c.c_hash >= 153 and c.c_hash <= 903
;
