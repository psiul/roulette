select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 588 and ss.ss_hash <= 988 and hd.hd_hash >= 227 and hd.hd_hash <= 977 and d.d_hash >= 317 and d.d_hash <= 650
;
