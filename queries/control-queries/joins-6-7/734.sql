select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 543 and ss.ss_hash <= 943 and i.i_hash >= 12 and i.i_hash <= 762 and c.c_hash >= 200 and c.c_hash <= 533
;
