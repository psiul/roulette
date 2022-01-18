select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 500 and ss.ss_hash <= 833 and i.i_hash >= 105 and i.i_hash <= 855 and c.c_hash >= 249 and c.c_hash <= 649
;
