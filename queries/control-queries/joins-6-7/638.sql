select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 27 and ss.ss_hash <= 360 and d.d_hash >= 539 and d.d_hash <= 939 and i.i_hash >= 179 and i.i_hash <= 929
;
